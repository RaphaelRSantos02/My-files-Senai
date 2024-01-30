from django.db import models
# Create your models here.

class Episode(models.Model):
    name = models.CharField(max_length=150)
    air_date = models.DateField()
    episode = models.IntegerField()
    characters = models.CharField(max_length=150)
    created = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name

class Location(models.Model):
    name = models.CharField(max_length=150)
    type = models.CharField(max_length=150)
    dimension = models.CharField(max_length=150)
    residents = models.CharField(max_length=150)
    created = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name

class Characters(models.Model):
    STATUS = [
        ('Alive', 'Alive'),
        ('Dead', 'Dead'),
        ('Unknown','Unknown')
    ]

    GENERO = [
        ('Female', 'Female'),
        ('Male', 'Male'),
        ('Genderless', 'Genderless'),
        ('Unknown', 'Unknown')
    ]
    name = models.CharField(max_length=150)
    status = models.CharField(max_length=150, choices=STATUS)
    species = models.CharField(max_length=150)
    type = models.CharField(max_length=150)
    gender = models.CharField(max_length=150, choices=GENERO)
    origin = models.ForeignKey('Location', related_name='origin',on_delete=models.CASCADE, blank=True, null=True)
    location = models.ForeignKey(Location, related_name='location',on_delete=models.CASCADE)
    image = models.CharField(max_length=10000)
    episodes = models.TextField()
    created = models.DateTimeField(auto_now_add=True)
    
    def __str__(self):
        return self.name