from rest_framework import serializers
from .models import *

class CharactersSerializer(serializers.ModelSerializer):
    class Meta:
        many = True
        model = Characters
        fields = '__all__'

class EpisodeSerializer(serializers.ModelSerializer):
    class Meta:
        many = True
        model = Episode
        fields = '__all__'


class LocationSerializer(serializers.ModelSerializer):
    class Meta:
        many = True
        model = Location
        fields = '__all__'