from django.db import models
from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin
from .gerenciador import Gerenciador

class CustomUser(AbstractBaseUser, PermissionsMixin):
    email = models.EmailField("endereço de email", unique=True)
    is_staff =  models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    telefone = models.CharField(max_length=15, null=True, blank=True)
    endereco = models.CharField(max_length=200)
    cpf = models.CharField(max_length=20)

    objects = Gerenciador()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []

    def __str__(self):
        return self.email


class CategoriaProdutos(models.Model):
    nome = models.CharField(max_length=100)

    def __str__(self):
        return self.nome

class Produtos(models.Model):
    categoriaFK = models.ForeignKey(CategoriaProdutos, related_name='CategoriaDoProduto', on_delete= models.CASCADE)
    nome = models.CharField(max_length=100)
    preco = models.DecimalField(max_digits=5, decimal_places=2)
    quantidade = models.IntegerField()

    def __str__(self):
        return self.nome
    
STATUS_PAGAMENTOS = [
    {"P", "PENDENTE"},
    {"A", "APROVADO"},
    {"R", "RECUSADO"},
    {"C", "CANCELADO"}
]

class Vendas(models.Model):
    usuarioFK = models.ForeignKey(CustomUser, related_name="UsuarioCustumizado", on_delete=models.CASCADE)
    dataHora = models.DateTimeField(auto_now_add=True)
    status = models.CharField(max_length=30, choices=STATUS_PAGAMENTOS)

    def __str__(self):
        return self.status
    

class VendasProdutos(models.Model):
    ProdutoFK = models.ForeignKey(Produtos, related_name="VendasDeProdutos", on_delete=models.CASCADE)
    quantidade = models.IntegerField()
    vendasFK = models.ForeignKey(Vendas, related_name="VendasFK", on_delete=models.CASCADE)

    def __str__(self):
        return self.ProdutoFK.nome
    
