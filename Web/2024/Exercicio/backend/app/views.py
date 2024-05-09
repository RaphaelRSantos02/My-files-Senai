from django.shortcuts import render
from .models import *
from .serializers import *

from rest_framework.viewsets import ModelViewSet
from rest_framework.permissions import IsAuthenticated


class CategoriaProdutosView(ModelViewSet):
    queryset = CategoriaProdutos.objects.all() #select *from CategoriaProdutos
    serializer_class = CategoriaProdutosSerializer
    permission_classes = (IsAuthenticated,)

class ProdutosView(ModelViewSet):
    queryset = Produtos.objects.all() 
    serializer_class = ProdutosSerializer

class VendasView(ModelViewSet):
    queryset = Vendas.objects.all() 
    serializer_class = VendasSerializer

class VendasProdutosView(ModelViewSet):
    queryset = VendasProdutos.objects.all() 
    serializer_class = VendaProdutosSerializer


