import os, re, sys
import arxiv

def paper_to_filename(paper: dict) -> str:
    authors = paper["authors"]
    title_str = " ".join(map(str.strip, paper["title"].split("\n")))
    author_str = authors[0] if len(authors) == 0 else f"{authors[0]} et al."
    filename = f"{author_str} - {title_str}"

    print(f"{filename}.pdf")
    print(f"url:     {paper['arxiv_url']}")
    print(f"author:  {paper['author']}")   # "main" author
    print(f"authors: {paper['authors']}")  # list of all authors
    print(f"title:   {paper['title']}\n")
    return filename

def parse_line(line: str):
    id_pattern = r"(\d{4}\.\d{4,6}(v\d+)?)"
    m = re.match(fr".*{id_pattern}(\.pdf)?$", line)
    return m.group(1) if m is not None else None

# List of folders where the script will run
# Note: use absolute paths
folders = ['/mnt/c/Users/gsanm/Downloads/']

for folder in folders:
    files = []
    for file in os.listdir(folder):
        if file.endswith(".pdf"):
            files.append(file)
    paper_ids = [parse_line(file.strip()) for file in files]
    paper_ids = [x for x in paper_ids if x is not None]
    papers = arxiv.query(id_list=paper_ids)

    for paper, paper_id in zip(papers, paper_ids):
        print(os.path.join(folder, paper_id + '.pdf'))
        if os.path.exists(os.path.join(folder, paper_id + '.pdf')):
            print("[Renamed]")
            os.rename(os.path.join(folder, paper_id + '.pdf'),
                        os.path.join(folder, paper_to_filename(paper) + '.pdf'))
        else:
            print("[Downloaded]")
            arxiv.download(paper, slugify=paper_to_filename)