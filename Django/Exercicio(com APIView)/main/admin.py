from django.contrib import admin
from .models import *
# Register your models here.

class detCharacters(admin.ModelAdmin):
    list_display = ('id', 'name','episodes', 'gender', 'status')
    list_display_links = ('id', 'name',)
    search_fields = ('name',)
    list_per_page = 10

admin.site.register(Characters,detCharacters)

class detEpisode(admin.ModelAdmin):
    list_display = ('id', 'episode','air_date')
    list_display_links = ('id',)
    search_fields = ('episode',)
    list_per_page = 10

admin.site.register(Episode,detEpisode)

class detLocation(admin.ModelAdmin):
    list_display = ('id', 'name')
    list_display_links = ('id', 'name',)
    search_fields = ('name',)
    list_per_page = 10

admin.site.register(Location,detLocation)