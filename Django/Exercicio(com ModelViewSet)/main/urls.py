from django.urls import path 
from .views import  *

from rest_framework.routers import DefaultRouter

router = DefaultRouter()
router.register('characters', CharactersAPIView)
router.register('location',  LocationAPIView)
router.register('episode',  EpisodeAPIView)

urlpatterns = router.urls