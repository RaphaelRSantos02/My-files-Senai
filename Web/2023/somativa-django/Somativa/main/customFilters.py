from rest_framework import filters
import  django_filters
from .models import *

class C_servicoFilter(django_filters.FilterSet):
    nome = django_filters.CharFilter(lookup_expr='icontains')

    class meta:
        model = C_servico
        fields = ['servico']

class ProdutoFilter(django_filters.FilterSet):
    nome = django_filters.CharFilter(lookup_expr='icontains')
    qtd = django_filters.NumberFilter()
    
    class meta:
        model = Produto
        fields = ['nome','qtd_estoque']
    
class CompradoFilter(django_filters.FilterSet):
    final = django_filters.RangeFilter()

    class meta:
        model = Produtos_comprados
        fields = ['final']

class CustomUserFilter(django_filters.FilterSet):
    email = django_filters.CharFilter(lookup_expr='icontains')
    classificacao = django_filters.CharFilter(lookup_expr='exact')

    class meta:
        model = CustomUser
        fields = ['email','classificacao']

class AutomovelFilter(django_filters.FilterSet):
    categoria = django_filters.CharFilter(lookup_expr='exact')
    marca = django_filters.CharFilter(lookup_expr='icontains')
    modelo =  django_filters.CharFilter(lookup_expr='icontains')
    ano = django_filters.NumberFilter()

    class meta:
        model = Automovel
        fields = ['categoria','marca','modelo','ano']

class ManutencaoFilter(django_filters.FilterSet):
    valor = django_filters.RangeFilter()
    
    class meta: 
        model = Manutencao
        fields = ['valor_total']

class PagamentoFilter(django_filters.FilterSet):
    status = django_filters.CharFilter(lookup_expr='icontains')
    pagamento = django_filters.CharFilter(lookup_expr='icontains')
    valor = django_filters.RangeFilter()

    class meta:
        model = Pagamento
        fields = ['status','c_pagamento', 'valor_final']

class DisponibilidadeFilter(django_filters.FilterSet):
    dia = django_filters.CharFilter(lookup_expr='icontains')

    class meta:
        model = Disponibilidade
        fields = ['dia']

class ReservaFilter(django_filters.FilterSet):
    posto = django_filters.CharFilter(lookup_expr='icontains')
    dia = django_filters.DateFilter()

    class meta:
        model = Reserva
        fields = ['posto', 'dia_reserva']