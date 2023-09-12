from django.urls import path 
from .views import  *

urlpatterns = [
    path('character/', CharactersAPIView.as_view(), name="character"),
    path('character/<int:CharactersId>', CharactersAPIView.as_view(), name="characterById"),
    path('location/', LocationAPIView.as_view(), name="location"),
    path('location/<int:LocationId>', LocationAPIView.as_view(), name="locationById"),
    path('episode/', EpisodeAPIView.as_view(), name="episode"),
    path('episode/<int:EpisodeId>', EpisodeAPIView.as_view(), name="episodeById"),
]