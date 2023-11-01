
from .models import *
from .serializer import *
from rest_framework.viewsets import ModelViewSet
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.permissions import IsAuthenticated

# Create your views here.
class CharactersAPIView(ModelViewSet):
    queryset = Characters.objects.all()
    serializer_class = CharactersSerializer
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['name', 'status', 'origin'] #campos que podem ser filtrados filtrar
    permission_classes =(IsAuthenticated,)
    
class EpisodeAPIView(ModelViewSet):
    queryset = Episode.objects.all()
    serializer_class = EpisodeSerializer
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['name', 'episode'] #campos que podem ser filtrados filtrar

        
    
class LocationAPIView(ModelViewSet):
    queryset = Location.objects.all()
    serializer_class = LocationSerializer
    filter_backends = [DjangoFilterBackend] #biblioteca para filtro
    filterset_fields = ['name','dimension'] #campos que podem ser filtrados filtrar
    permission_classes =(IsAuthenticated,)
