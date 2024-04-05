from .models import *
from rest_framework import serializers

class UserSerializer(serializers.ModelSerializer):
    class meta:
        model = User
        fields = ('id', 'username','email', 'is_superuser', 'first_name', 'last_login')
        many = True


class CustomUserSerializer(serializers.ModelSerializer):
    user = UserSerializer(read_only=True)
    class meta:
        model = CustomUser
        fields = '__all__'
        many = True


class C_servicoSerializer(serializers.ModelSerializer):
    class meta:
        model = C_servico
        fields = '__all__'
        many = True

class ProdutoSerializer(serializers.ModelSerializer):
    class meta:
        model = Produto
        fields = '__all__'
        many = True
    
class Produtos_compradosSerializer(serializers.ModelSerializer):
    ProdutoFK = ProdutoSerializer(read_only=True)
    class meta:
        model = Produtos_comprados
        fields = '__all__'
        many = True

class AutomovelSerializer(serializers.ModelSerializer):
    class meta:
        model = Automovel
        fields = '__all__'
        many = True

class ManutencaoSerializer(serializers.ModelSerializer):
    customFk = CustomUserSerializer(read_only=True)
    c_servicoFk = C_servicoSerializer(read_only=True)
    compradosFk = Produtos_compradosSerializer(read_only=True)
    AutomovelFk = AutomovelSerializer(read_only=True)
    class meta:
        model = Manutencao
        fields = '__all__'
        many = True

class PagamentoSerializer(serializers.ModelSerializer):
    ManutencaoFK = ManutencaoSerializer(read_only=True)
    class meta:
        model = Pagamento
        fields = '__all__'
        many = True

class DisponibilidadeSerializer(serializers.ModelSerializer):
    class meta:
        model = Disponibilidade
        fields = '__all__'
        many = True

class ReservaSerializer(serializers.ModelSerializer):
    disponibilidadeFK = DisponibilidadeSerializer(read_only=True)
    AutomovelFK = AutomovelSerializer(read_only = True)
    class meta:
        model = Reserva
        fields = '__all__'
        many = True