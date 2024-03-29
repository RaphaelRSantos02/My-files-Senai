from django.db import models
from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin
from django.utils import timezone


BLOCKS = [
    ('A', 'Bloco A'),
    ('B', 'Bloco B'),
    ('C', 'Bloco C'),
]

class Enviorements(models.Model):
    name = models.CharField(max_length=100)
    block = models.CharField(max_length=30, choices=BLOCKS)
 
    def __str__(self):
        return self.name
#criando uma classe de usuario customizado para substituir a padrão com atributos desejados    
class CustomUser(AbstractBaseUser, PermissionsMixin):
    email = models.EmailField("email address", unique=True)
    is_staff = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    data_joined = models.DateTimeField(default=timezone.now)
    registrationNumber = models.CharField(max_length=30)
    phoneNumber = models.CharField(max_length=15, null=True, blank=True)
    is_email_verified = models.BooleanField(default = False)

    USERNAME_FIELD = "email"
    REQUIRED_FIELDS = []

    def __str__(self):
        return self.email

class Equipments(models.Model):
    name = models.CharField(max_length= 100)
    code = models.IntegerField()
    assigneeFK = models.ForeignKey(CustomUser, related_name="Responsavel_equipamento", on_delete=models.CASCADE, blank=True, null=True)

    def __str__(self):
        return self.name
    
TASK_TYPES = [
    ('M', 'Manuntenção'),
    ('ME','Melhoria')
]
TASK_STATUS = [
    ('AB', 'Aberta'),
    ('EA', 'Em Andamento'),
    ('CA', 'Cancelada'),
    ('CO', 'Concluida'),
    ('EN', 'Encerrada'),


]

class Tasks(models.Model):
    enviorementsFK = models.ForeignKey(Enviorements, related_name="Ambientes_tarefas", on_delete=models.CASCADE)
    repoterFK = models.ForeignKey(CustomUser, related_name="Responsavel_tarefas", on_delete=models.CASCADE)
    creationDate = models.DateTimeField(auto_now_add=True)
    title = models.CharField(max_length=100)
    description = models.CharField(max_length=2000)
    diagnostic = models.CharField(max_length=200, null = True, blank=True)
    type = models.CharField(max_length=100, choise = TASK_TYPES)
    status = models.CharField(max_length=30, choise = TASK_STATUS)
    enviorementsAlocationFK = models.ForeignKey(EnviorementsAlocation, related_name='AmbienteAlocada_Tarefas', on_delete=models.CASCADE)

    def __str__(self):
        return self.title

class TaskAssignees(models.Model):
    taskFk = models.ForeignKey(Tasks, related_name="Tarefa", on_delete = models.CASCADE)
    assigneeFK = models.ForeignKey(CustomUser, related_name="Responsavel_da_Tarefas", on_delete=models.CASCADE)

    def __str__(self):
        return self.taskFk.title
    
class TaskStatus(models.Model):
    taskFk = models.ForeignKey(Tasks, related_name="Tarefa_status", on_delete = models.CASCADE)
    status = models.CharField(max_length=100, choise = TASK_STATUS)
    creationDate = models.DateTimeField(auto_now_add=True)
    comment = models.CharField(max_length=300)

    def __str__(self):
        return self.title
