from rest_framework import serializers
from .models import *

class UsuarioCustomizadoSerializer(serializers.ModelSerializer):
    class Meta:
        model = UsuarioCustomizado
        fields = '__all__'
        many = True

class CategoriaProdutosSerializer(serializers.ModelSerializer):
    class Meta:
        model = CategoriaProdutos
        fields = '__all__'
        many = True

class ProdutosSerializer(serializers.ModelSerializer):
    class Meta:
        model = Produtos
        fields = '__all__'
        many = True


class VendasSerializer(serializers.ModelSerializer):
    class Meta:
        model = Vendas
        fields = '__all__'
        many = True


class VendaProdutosSerializer(serializers.ModelSerializer):
    class Meta:
        model = VendasProdutos
        fields = '__all__'
        many = True

