import requests
import json


class TelegramNotifier(object):

    def __init__(self, botToken, chatId):
        self.botToken = botToken
        self.chatId = chatId

    def sendText(self, text, chatId=None):
        if chatId is None:
            chatId = self.chatId

        url = f"https://api.telegram.org/bot{self.botToken}/sendMessage"

        r = requests.post(url, data={"chat_id": chatId,
                                     "text": text})

        return json.loads(r.text)

    def sendImage(self, image, text="", chatId=None):

        if chatId is None:
            chatId = self.chatId

        url = f"https://api.telegram.org/bot{self.botToken}/sendPhoto"

        r = requests.post(url,
                          data={"chat_id": chatId,
                                "caption": text},
                          files={"photo": open(image, 'rb')})

        return json.loads(r.text)

    def sendDocument(self, document, text="", chatId=None):

        if chatId is None:
            chatId = self.chatId

        url = f"https://api.telegram.org/bot{self.botToken}/sendDocument"

        r = requests.post(url,
                          data={"chat_id": chatId,
                                "caption": text},
                          files={"document": open(document, 'rb')})

        return json.loads(r.text)
