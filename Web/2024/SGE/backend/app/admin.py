from django.contrib import admin
from .models import *

class AdminCustomUser(admin.ModelAdmin):
    list_display = ('id','email','registrationNumber','is_active')
    list_display_links = ('id','email','registrationNumber','is_active',)
    search_fields = ('email','registrationNumber',)
    list_per_page = 10

admin.site.register(CustomUser,AdminCustomUser)

class AdminEnvironments(admin.ModelAdmin):
    list_display = ('id','name','block')
    list_display_links = ('id','name','block',)
    search_fields = ('name','block',)
    list_per_page = 10

admin.site.register(Environment,AdminEnvironments)

class AdminTasks(admin.ModelAdmin):
    list_display = ('id','title','environmentFK', 'creationDate')
    list_display_links = ('id','title','environmentFK', 'creationDate',)
    search_fields = ('title',)
    list_per_page = 10

admin.site.register(Tasks,AdminTasks)

class AdminTasksAssignees(admin.ModelAdmin):
    list_display = ('id','taskFk','assigneeFK')
    list_display_links = ('id','taskFk','assigneeFK',)
    search_fields = ('taskFk',)
    list_per_page = 10

admin.site.register(TaskAssignees,AdminTasksAssignees)

class AdminEquipments(admin.ModelAdmin):
    list_display = ('id','name','code')
    list_display_links = ('id','name','code',)
    search_fields = ('name','code',)
    list_per_page = 10

admin.site.register(Equipments,AdminEquipments)

class AdminTasksStatus(admin.ModelAdmin):
    list_display = ('id','taskFk','status')
    list_display_links = ('id','taskFk','status',)
    search_fields = ('taskFk',)
    list_per_page = 10

admin.site.register(TaskStatus,AdminTasksStatus)

class AdminphotosTasksStatus(admin.ModelAdmin):
    list_display = ('id','taskStatusFk','fileType')
    list_display_links = ('id','taskStatusFk','fileType',)
    search_fields = ('taskStatusFk',)
    list_per_page = 10

admin.site.register(photosTasksStatus,AdminphotosTasksStatus)

class AdminTasksEquipments(admin.ModelAdmin):
    list_display = ('id','taskFk','equipmentsFK')
    list_display_links = ('id','taskFk','equipmentsFK',)
    search_fields = ('equipmentsFK',)
    list_per_page = 10

admin.site.register(TasksEquipments,AdminTasksEquipments)

class AdminEnviromentsAssignees(admin.ModelAdmin):
    list_display = ('id','environmentFK','assigneeFK')
    list_display_links = ('id','environmentFK','assigneeFK',)
    search_fields = ('environmentFK',)
    list_per_page = 10

admin.site.register(EnvironmentAssingnees,AdminEnviromentsAssignees)

class AdminThemes(admin.ModelAdmin):
    list_display = ('id','name','timeLoad')
    list_display_links = ('id','name','timeLoad',)
    search_fields = ('name',)
    list_per_page = 10

admin.site.register(Theme,AdminThemes)

class AdminCourses(admin.ModelAdmin):
    list_display = ('id','name','category', 'durationType', 'area')
    list_display_links = ('id','name','durationType', 'area',)
    search_fields = ('name',)
    list_per_page = 10

admin.site.register(Courses,AdminCourses)

class AdminCoursesThemes(admin.ModelAdmin):
    list_display = ('id','courseFK','themeFK')
    list_display_links = ('id','courseFK','themeFK',)
    search_fields = ('courseFK','themeFK',)
    list_per_page = 10

admin.site.register(CoursesThemes,AdminCoursesThemes)

class AdminClasses(admin.ModelAdmin):
    list_display = ('id','name','courseFK')
    list_display_links = ('id','name','courseFK',)
    search_fields = ('name','courseFK',)
    list_per_page = 10

admin.site.register(Class,AdminClasses)

class AdminClassesDivision(admin.ModelAdmin):
    list_display = ('id','name','classFK')
    list_display_links = ('id','name','classFK',)
    search_fields = ('name','classFK',)
    list_per_page = 10

admin.site.register(ClassDivison,AdminClassesDivision)

class AdminTeacherAlocation(admin.ModelAdmin):
    list_display = ('id','classFK','themeFK')
    list_display_links = ('id','classFK','themeFK',)
    search_fields = ('classFK','themeFK',)
    list_per_page = 10

admin.site.register(TeacherAlocation,AdminTeacherAlocation)


class AdminTeacherAlocationDetail(admin.ModelAdmin):
    list_display = ('id','customUserFK','classDivisionFK','alocationStatus')
    list_display_links = ('id','customUserFK','classDivisionFK','alocationStatus',)
    search_fields = ('customUserFK','classDivisionFK',)
    list_per_page = 10

admin.site.register(TeacherAlocationDetail,AdminTeacherAlocationDetail)


class AdminTeacherAlocationDetailEnvironment(admin.ModelAdmin):
    list_display = ('id','teacherAlocationDetailFK','environmentFK')
    list_display_links = ('id','teacherAlocationDetailFK','environmentFK',)
    search_fields = ('teacherAlocationDetailFK','environmentFK',)
    list_per_page = 10

admin.site.register(TeacherAlocationDetailEnv,AdminTeacherAlocationDetailEnvironment)


class AdminDeadline(admin.ModelAdmin):
    list_display = ('id','targetDate','category')
    list_display_links = ('id','targetDate','category',)
    search_fields = ('targetDate','category',)
    list_per_page = 10

admin.site.register(deadline,AdminDeadline)

class AdminSignatures(admin.ModelAdmin):
    list_display = ('id','customuserFk','createdDate')
    list_display_links = ('id','customuserFk','createdDate',)
    search_fields = ('customuserFk',)
    list_per_page = 10

admin.site.register(signatures,AdminSignatures)

class AdminPlan(admin.ModelAdmin):
    list_display = ('id','customuserFk','coursesThemesFK','status')
    list_display_links = ('id','customuserFk','coursesThemesFK','status',)
    search_fields = ('customuserFk',)
    list_per_page = 10

admin.site.register(Plan,AdminPlan)

class AdminPlanStatus(admin.ModelAdmin):
    list_display = ('id','planFK','createdDate','status')
    list_display_links = ('id','planFK','createdDate','status',)
    search_fields = ('planFK',)
    list_per_page = 10

admin.site.register(PlanStatus,AdminPlanStatus)