from .models import *
from .serializer import *
from rest_framework.views import APIView
from rest_framework.response import Response

# Create your views here.
class CharactersAPIView(APIView):
    def get(self, request, charactersID = ''):
        if charactersID == '':
            Found = Characters.objects.all()
            serializer = CharactersSerializer(Found, many = True)
            return(serializer.data)
        try:
            Found = Characters.objects.get(id=charactersID)
            serializer= CharactersSerializer(Found, many = False)
            return Response(serializer.data)
        except Characters.DoesNotExist:
            return Response(status = 404, data="Character not Found!!!!")
    def post(self, request):
        #Pega o Json do cliente e guardando na variavel
        charactersJson = request.data #insert no mysql
        #convertendo o Json em python
        charactersSerialized = CharactersSerializer(data=charactersJson, many = False)
        #Verificar se os dados estão coerente
        if charactersSerialized.is_valid():
            #salvando no banco de dados
            charactersSerialized.save()
            return Response(status=203, data=charactersSerialized.data)
        return Response(status=400, data="MANDA CERTO!!!!!!!!!!!")

class EpisodeAPIView(APIView):
    def get(self, request, EpisodeID = ''):
        if EpisodeID == '':
            Found = Episode.objects.all()
            serializer = EpisodeSerializer(Found, many = True)
            return(serializer.data)
        Found = Episode.objects.get(id=EpisodeID)
        serializer= EpisodeSerializer(Found, many = False)
        return Response(serializer.data)
    
class LocationAPIView(APIView):
    def get(self, request, LocationID = ''):
        if LocationID == '':
            Found = Location.objects.all()
            serializer = LocationSerializer(Found, many = True)
            return(serializer.data)
        Found = Location.objects.get(id=LocationID)
        serializer= LocationSerializer(Found, many = False)
        return Response(serializer.data)
        