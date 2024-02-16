
from rest_framework.views import APIView
from rest_framework.response import Response
from bardapi import BardCookies
import requests, json

mockEnable = False
mockedAnswer = '{"content": "vasco", "contentId": "383rejdsidas"}'

psid = "g.a000gAikftj6GKC9-K_qbJIkEtyRGL16BWUoBcWgz-GBVBUsN79Gr2ZdeQBKktm6vlSMhkzzUAACgYKAUUSAQASFQHGX2Mijl0jINOsmkIUI2ZeMb3bQRoVAUF8yKqAgEmO1stNJOKFZLyAY_1D0076"
psidts = "sidts-CjEBPVxjStD0-CsGbPJqunYX-UpGCb4b4pT2NtP9l_qbQrxTvIaydBE5FcnfyHJ521YfEAA"
psidcc = "ABTWhQEUf9VfR5n2JYUarD94APxwiImUFdDyggtSrMGJg512Y-2PwSLYiDWKQN3e-vDszr-iGw"
#cria um conjunto com os tokens de autenticação
#para poder usar o Bard
tokenCookies = {
    "__Secure-1PSID": psid,
    "__Secure-1PSIDTS": psidts,
    "__Secure-1PSIDCC": psidcc, 
}


#define as ações da API para receber
#os comandos a ser passado para o Bard
class ChatBotAPIView(APIView):
    def post(self, request):
        if mockEnable == True: 
            return Response(status=201,data=json.loads(mockedAnswer))
        

        #cria o objeto bard para ser usado
        bard = BardCookies(cookie_dict=tokenCookies)


        #pega os dados que veio na requisição
        data = request.data

        #pega o dados da conversationId caso ele seja informado para mander a mesma conversa com o chatbot
        conversationId = data.get("conversationId")

        #verifica se o id da conversa foi recebido
        if(conversationId is not None):

            #informa o bard para responder na conversa desejada
            bard.conversation_id = conversationId
        else:
            bard.conversation_id = None
        
        answer = bard.get_answer(data['question'])

        return Response(status=201,data=answer)

