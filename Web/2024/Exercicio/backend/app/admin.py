from django.contrib import admin
from .models import *
from django.contrib.auth.admin import UserAdmin

class AdminCustomUser(UserAdmin):
    model= CustomUser
    list_display = ['id', 'email', 'cpf']
    list_display_links = ('id', 'email', 'cpf',)
    ordering=['email']
    search_fields  = ['nome',]

admin.site.register(CustomUser, AdminCustomUser)

class AdminCategoria(admin.ModelAdmin):
    list_display = ['id', 'nome']
    list_display_links = ('id', 'nome',)
    search_fields = ('nome',)
    list_per_page = 10

admin.site.register(CategoriaProdutos,AdminCategoria)

class AdminProdutos(admin.ModelAdmin):
    list_display = ['id', 'nome', 'categoriaFK']
    list_display_links = ('id', 'nome','categoriaFK',)
    search_fields = ('nome',)
    list_per_page = 10

admin.site.register(Produtos,AdminProdutos)

class AdminVendas(admin.ModelAdmin):
    list_display = ['id', 'usuarioFK', 'status', 'dataHora']
    list_display_links = ('id', 'usuarioFK','status','dataHora', )
    search_fields = ('usuarioFK',)
    list_per_page = 10

admin.site.register(Vendas,AdminVendas)

class AdminVendasProdutos(admin.ModelAdmin):
    list_display = ['id', 'ProdutoFK', 'quantidade','vendasFK' ]
    list_display_links = ('id', 'ProdutoFK', 'quantidade','vendasFK',)
    search_fields = ('ProdutoFK', 'quantidade','vendasFK',)
    list_per_page = 10

admin.site.register(VendasProdutos,AdminVendasProdutos)

