import os, re, sys
import arxiv

def paper_to_filename(paper: dict) -> str:
    # paper id
    ids = paper['arxiv_url'].split('/')[-1]
    # paper author
    authors = paper["authors"]
    author_str = authors[0] if len(authors) == 0 else f"{authors[0]} et al."
    # paper title
    title_str = " ".join(map(str.strip, paper["title"].split("\n")))
    # generate filename
    filename = f"[{ids}] - {author_str} - {title_str}"
    for c in [':', '?']:
        filename = filename.replace(c, ' ')
    return filename

def parse_line(line: str):
    id_pattern = r"(\d{4}\.\d{4,6}(v\d+)?)"
    m = re.match(fr".*{id_pattern}(\.pdf)?$", line)
    return m.group(1) if m is not None else None

# List of folders where the script will run
# Note: use absolute paths
folders = [r'C:\Users\gsanmartin\Downloads',]
folder_dest = r'C:\Users\gsanmartin\Dropbox\Articles'
# iterate over folders, searching for pds.
# if a pdf filename matches a download arxiv paper, put a
# better title
for folder in folders:
    files = []
    for file in os.listdir(folder):
        if file.endswith(".pdf"):
            files.append(file)
    paper_ids = [parse_line(file.strip()) for file in files]
    paper_ids = [x for x in paper_ids if x is not None]
    papers = arxiv.query(id_list=paper_ids)

    for paper, paper_id in zip(papers, paper_ids):
        paper_name = paper_to_filename(paper)
        if os.path.exists(os.path.join(folder, paper_id + '.pdf')):
            os.rename(os.path.join(folder, paper_id + '.pdf'),
                        os.path.join(folder_dest, paper_name + '.pdf'))
        else:
            pass