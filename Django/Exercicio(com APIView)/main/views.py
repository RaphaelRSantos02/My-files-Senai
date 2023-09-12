from .models import *
from .serializer import *
from rest_framework.views import APIView
from rest_framework.response import Response

# Create your views here.
class CharactersAPIView(APIView):
    def get(self, request, CharactersId = ''):
        if CharactersId == '':
            found =''
            #Se passaram o filtro de 'name'
            if 'name' in request.GET and 'species' in request.GET:
                #pegando o parametro que foi informado!
                NameToFilter = request.GET['name']
                speciesToFilter = request.GET['species']
                #select *from character where name like %NameToFilter% <--- seria isso em sql
                found = Characters.objects.filter(__name__contains = NameToFilter).filter(__name__contains = speciesToFilter)
            elif 'name' in request.GET:
                NameToFilter = request.GET['name']
                found = Characters.objects.filter(__name__contains = NameToFilter)
            elif 'species' in request.GET:
                speciesToFilter = request.GET['species']
                found = Characters.objects.filter(__name__contains = speciesToFilter)
            else:
                found = Characters.objects.all()
                serializer = CharactersSerializer(found, many = True)
                return(serializer.data)
        try:
            found = Characters.objects.get(id=CharactersId)
            serializer= CharactersSerializer(found, many = False)
            return Response(serializer.data)
        except Characters.DoesNotExist:
            return Response(status = 404, data="Character not Found!!!!")

    def delete(self,request, CharactersId = ''):
        
        if(CharactersId != ''):

            #Procura o personagem com o id:
            found = Characters.objects.get(id = CharactersId)

            #Deletando o usuario encontrado
            found.delete()
            return Response(status = 200, data='Character successfully deleted!')
        
            #cliente do API não passou o CharacterId para deletar
        return Response(status = 400, data='Character must be given!!')
    def put(self, resquest, CharactersId = ''):
        if(CharactersId != ''):

            #Procura o antigo no banco:
            found = Characters.objects.get(id=CharactersId)

            #Coletar o novo que veio em JSON:
            Update = resquest.data

            # Faz o serializer substituir o antigo pelo novo e converter em python
            serializedCharacter = CharactersSerializer(found, data=Update)

            #Verifica se a conversão é valida
            if(serializedCharacter.is_valid()):
                serializedCharacter.save()
                return Response(status=200, data=serializedCharacter.data)
            
        #cliente do API não passou o CharacterId para editar
        return Response(status=400, data='Invalid Data!')



class EpisodeAPIView(APIView):
    def get(self, request, EpisodeId = ''):
        if EpisodeId == '':
            Found = Episode.objects.all()
            serializer = EpisodeSerializer(Found, many = True)
            return(serializer.data)
        try:
            Found = Episode.objects.get(id=EpisodeId)
            serializer= EpisodeSerializer(Found, many = False)
            return Response(serializer.data)
        except Episode.DoesNotExist:
            return Response(status = 404, data='Episode not found!!!')
    def post(self, resquest):
        episodeJSON= resquest.data
        EpisodeSerialized = EpisodeSerializer(data=episodeJSON, many= False)
        if EpisodeSerialized.is_valid():
            EpisodeSerialized.save()
            return Response(status=203, data=EpisodeSerialized.data)
        return Response(status=400, data='SEND THIS RIGHT, BITCH!!!!!')
    def delete(self,resquest, EpisodeId = ''):

        if (EpisodeId != ''):
            found = Episode.objects.get(id=EpisodeId)

            found.delete()
            return Response(status=200,data='Episode successfully deleted!')

    def put(self,resquest, EpisodeId = ''):
        if(EpisodeId != ''):
            found = Episode.objects.get(id=EpisodeId)
            updata = resquest.data
            EpisodeSerialized = EpisodeSerializer(found,data=updata)
            if(EpisodeSerialized.is_valid()):
                EpisodeSerialized.save()
                return Response(status=200,data=EpisodeSerialized.data)
        return Response(status=400,data='Invalid Data!!')
        
    
class LocationAPIView(APIView):
    def get(self, request, LocationId = ''):
        if LocationId == '':
            Found = Location.objects.all()
            serializer = LocationSerializer(Found, many = True)
            return(serializer.data)
        try:
            Found = Location.objects.get(id=LocationId)
            serializer= LocationSerializer(Found, many = False)
            return Response(serializer.data)
        except Location.DoesNotExist:
            return Response(status=404, data='Location not found!!!')
    def post(self, resquest):

        LocationJSON= resquest.data
        LocationSerialized = LocationSerializer(data=LocationJSON, many= False)
        if LocationSerialized.is_valid():
            LocationSerialized.save()
            return Response(status=203, data=LocationSerialized.data)
        return Response(status=400, data='SEND THIS RIGHT, BITCH!!!!!')
    def delete(self,resquest, LocationId = ''):

        if (LocationId != ''):
            found = Location.objects.get(id=LocationId)

            found.delete()
            return Response(status=200,data='Location successfully deleted!')
        return Response(status=400,data='Location must be given!!')
    def put(self,resquest, LocationId = ''):
        if(LocationId != ''):
            found = Location.objects.get(id=LocationId)
            updata = resquest.data
            LocationSerialized = LocationSerializer(found,data=updata)
            if(LocationSerialized.is_valid()):
                LocationSerialized.save()

                return Response(status=200,data=LocationSerialized.data)
        return Response(status=400,data='Invalid Data!!')