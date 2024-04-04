from django.db import models
from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin
from django.utils import timezone


BLOCKS = [
    ('A', 'Bloco A'),
    ('B', 'Bloco B'),
    ('C', 'Bloco C'),
]

class Environment(models.Model):
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
    environmentFK = models.ForeignKey(Environment, related_name="Ambientes_tarefas", on_delete=models.CASCADE)
    repoterFK = models.ForeignKey(CustomUser, related_name="Responsavel_tarefas", on_delete=models.CASCADE)
    creationDate = models.DateTimeField(auto_now_add=True)
    title = models.CharField(max_length=100)
    description = models.CharField(max_length=2000)
    diagnostic = models.CharField(max_length=200, null = True, blank=True)
    type = models.CharField(max_length=100, choise = TASK_TYPES)
    status = models.CharField(max_length=30, choise = TASK_STATUS)

    def __str__(self):
        return self.title

class TaskAssignees(models.Model):
    taskFk = models.ForeignKey(Tasks, related_name="Reponsavel_pela_tarefa", on_delete = models.CASCADE)
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
    
FILE_TYPE = [
    ('D', 'Documento'),
    ('F', 'foto')
]

class photosTasksStatus(models.Model):
    taskStatusFk = models.ForeignKey(TaskStatus, related_name="fotos_tarefa", on_delete = models.CASCADE)
    link = models.CharField(max_length=100000)
    type = models.CharField(max_length=100, choise = TASK_TYPES)
    fileType = models.CharField(max_length=100, choise = FILE_TYPE)

    def __str__(self):
        return self.fileType

class TasksEquipments(models.Model):
    taskFk = models.ForeignKey(Tasks, related_name="Tarefa_do_equipamento", on_delete = models.CASCADE)
    equipmentsFK = models.ForeignKey(Equipments, related_name="equipamento_da_tarefa", on_delete = models.CASCADE)

    def __str__(self):
        return self.equipmentsFK.name
    
class EnvironmentAssingnees(models.Model):
    environmentFK = models.ForeignKey(Environment, related_name="Responsavel_ambientes_tarefas", on_delete=models.CASCADE)
    assigneeFK = models.ForeignKey(CustomUser, related_name="Responsavel_do_ambiente", on_delete=models.CASCADE)

    def __str__(self):
        return self.environmentFK.name
    
CATEGORY_TYPE = [
    ("CAI", "Aprendizagem Industrial"),
    ("CT", "Curso Técnico"),
    ("CST", "Curso Superior Técnico"),
    ("FIC", "Formação continuada")
]

DURATION_TYPE = [
    ("H", "Horas"),
    ("S", "Semetre"),

]

AREA_TYPE = [
    ("TI","TI"),
    ("MEC","Mecatrônica"),
    ("ELÉTR","ELETRICISTA"),
]

MODALITY_TYPE = [
    ("EAD","Estudo a distancia"),
    ("P","Presencial"),
    ("H","Híbrido"),

]

class Theme(models.Model):
    name = models.CharField(max_length=200)
    timeLoad = models.IntegerField()

    def __str__(self):
        return self.name

class Courses(models.Model):
    name = models.CharField(max_length=200)
    category = models.CharField(max_length=200, choices=CATEGORY_TYPE)
    duration = models.IntegerField()
    durationType = models.CharField(max_length=100, choices=DURATION_TYPE)
    area = models.CharField(max_length=100, choices=AREA_TYPE)
    modality = models.CharField(max_length=100, choices=MODALITY_TYPE)
    #themes = models.ManyToManyField(Theme) ele engana a gente fazendo pensar que não precisa criar uma terceira
                                           #tabela porem ele cria por debaixo dos panos essa terceira tabela
                                           #porem mas vezes é melhor criar voce mesmo a terceira tabela

    
    def __str__(self):
        return self.name


class Class(models.Model):
    courseFK = models.ForeignKey(Courses, related_name="Curso_da_Sala", on_delete=models.CASCADE)
    name = models.CharField(max_length=100)
    startDate = models.DateField()
    endDate = models.DateField()

    def __str__(self):
        return self.name
    
class ClassDivison(models.Model):
    classFK = models.ForeignKey(Class, related_name="Divisão_da_sala", on_delete=models.CASCADE)
    name = models.CharField(max_length=200)

    def __str__(self):
        return self.name

class CoursesThemes(models.Model):
    courseFK = models.ForeignKey(Courses, related_name="Tema_do_curso", on_delete=models.CASCADE)
    themeFK = models.ForeignKey(Theme, related_name="Temas", on_delete=models.CASCADE)

    def __str__(self):
        return self.courseFK.name

class TeacherAlocation(models.Model):
    classFK = models.ForeignKey(Class, related_name="Classe_do_professor", on_delete=models.CASCADE)
    themeFK = models.ForeignKey(Theme, related_name="Temas_do_professor", on_delete=models.CASCADE)
    reporterFK = models.ForeignKey(CustomUser, related_name="professor_relator", on_delete=models.CASCADE)
    def __str__(self):
        return self.classFK.name

ALOCATION_STATUS = [
    ("1","Rascunho"),
    ("2", "Assinalado"),
    ("3","Concluido")
]

class TeacherAlocationDetail(models.Model):
    customUserFK = models.ForeignKey(CustomUser, related_name="detalhe_ambiente_do_professor", on_delete=models.CASCADE)
    classDivisionFK = models.ForeignKey(ClassDivison, related_name="classe_dividida", on_delete=models.CASCADE)
    creationDate = models.DateTimeField(auto_now_add=True)
    updatedDate = models.DateTimeField(auto_now=True)
    alocationStatus = models.CharField(max_length=100, choices=ALOCATION_STATUS, default="1")

    def __str__(self):
        return self.classDivisionFK.name

    
WEEK_DAY = [
    ("seg","segunda-Feira"),
    ("ter","terça-Feira"),
    ("qua","quarta-Feira"),
    ("qui","quinta-Feira"),
    ("sex","sexta-Feira"),
    ("sab","sabado-Feira"),
    ("dom","domingo-Feira"),

]

class TeacherAlocationDetailEnv(models.Model):
    environmentFK = models.ForeignKey(Environment, related_name="AMBIENTE_LOCAL_detalhado", on_delete=models.CASCADE)
    teacherAlocationDetailFK = models.ForeignKey(TeacherAlocationDetail, related_name="Detalhe_do_ambiente_do_professor_detalhado")
    weekDay = models.CharField(max_length=100)
    hourStart = models.TimeField()
    hourEnd = models.TimeField()
    startDate = models.DateField()
    endDate = models.DateField()

    def __str__(self):
        return self.environmentFK.name
    
class deadline(models.Model):
    targetDate = models.DateTimeField()
    category = models.CharField(max_length=200, choices=CATEGORY_TYPE)

    def __str__(self):
        return self.category

class signatures(models.Model):
    customuserFk = models.ForeignKey(CustomUser, related_name="assinatura_do_usuario", on_delete=models.CASCADE)
    signature = models.CharField(max_length=200)
    creationDate = models.DateField(auto_now_add=True)

    def __str__(self):
        return self.customuserFk.email

STATUS =[
    ("1","Pendente"),
    ("2","Em Aprovamento"),
    ("3","Aprovado"),
    ("4","Em Revisão"),
    ("5","Cancelado"),

]

class Plan(models.Model):
    customuserFk = models.ForeignKey(CustomUser, related_name="plano_do_usuario", on_delete=models.CASCADE)
    coursesThemesFK = models.ForeignKey(CoursesThemes, related_name="Tema_do_Curso", on_delete=models.CASCADE)
    status = models.CharField(max_length=100, choices=STATUS, default="1")
    signatureFK = models.ForeignKey(signatures, related_name="Assinatura_do_plano", on_delete=models.CASCADE, blank=True, null=True)
    approverFK = models.ForeignKey(CustomUser, related_name="Aprovador", on_delete=models.CASCADE)

    def __str__(self):
        return self.customuserFk.email

class PlanStatus(models.Model):
    planFK = models.ForeignKey(Plan, related_name="Status_plano", on_delete=models.CASCADE)
    status = models.CharField(max_length=100, choices=STATUS)
    datetime = models.DateTimeField()
    comment = models.CharField(max_length=500)
    file = models.CharField(max_length=10000)

    def __str__(self):
        return self.planFK.customuserFk.email
    
