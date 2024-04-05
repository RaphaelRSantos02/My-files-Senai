from django.db import models
from django.db.models.signals import post_save
from django.contrib.auth.models import User
from django.dispatch import receiver
from django.core.validators import MinValueValidator, MaxValueValidator
from django.utils.timezone import *



class C_servico(models.Model):
    servico = models.CharField(max_length=200, null=False, blank=False)
    preco = models.DecimalField(max_digits=100, decimal_places=2)

    def __str__(self):
        return self.servico



class Produto(models.Model):
    nome = models.CharField(max_length=150, null = False, blank=False)
    cod_fabricante = models.IntegerField()
    qtd_estoque = models.IntegerField()
    nome_fabricante = models.CharField(max_length=150, null = False, blank = False)
    valor_compra = models.DecimalField(max_digits=100, decimal_places=2, null=False)
    valor_venda = models.DecimalField(max_digits= 100, decimal_places=2, null=True)

    def __str__(self):
        return self.nome
    
class Produtos_comprados(models.Model):
    produtoFK = models.ForeignKey(Produto, related_name="Produtos_comprado", on_delete= models.CASCADE)
    qtd = models.IntegerField(validators=[MinValueValidator(1)])
    final = models.DecimalField(max_digits=20, decimal_places=2, null=True, blank= True)


    def save(self, *args, **kwargs):
        self.final = self.Qtd * self.produtoFK.valor_compra
        super(Produtos_comprados, self).save(*args, **kwargs)

class CustomUser(models.Model):
    hierarquia = [
        ('C', 'Cliente'),
        ('F', 'Funcionario'),
        ('A','Admin')
    ]
    user = models.OneToOneField(User, on_delete= models.CASCADE)
    email = models.CharField(max_length=50)
    telefone = models.IntegerField(validators=[MaxValueValidator(9)])
    cpf = models.IntegerField(validators=[MaxValueValidator(11)])
    classificacao = models.CharField(max_length=50, choices=hierarquia,default='C', null=False)

    def __str__(self):
        return self.user.email
    
    @receiver(post_save, sender=User)
    def criar_user(sender,instance,created, **kwargs):
        if created:
            CustomUser.objects.create(user=instance)
        
    @receiver(post_save, sender=User)
    def salvar_user(sender, instance, created, **kwargs):
        instance.customuser.save()   

class Automovel(models.Model):
    CATEGORIAS = [
        ("Moto", "Moto"),
        ("Carro", "Carro"),
        ("Caminhão", "Caminhão")
    ]

    categoria = models.CharField(max_length=200, choices=CATEGORIAS, null= False)
    marca = models.CharField(max_length=100)
    modelo = models.CharField(max_length=200, null= False)
    ano = models.IntegerField(null = True, blank = True)


class Manutencao(models.Model):
    CustomFK = models.ForeignKey(CustomUser, related_name="CustomUser_manutencao", on_delete=models.CASCADE)
    c_servicoFK = models.ForeignKey(C_servico, related_name="c_servico_manutencao", on_delete= models.CASCADE)
    compradosFK = models.ForeignKey(Produtos_comprados, related_name="Produtos_comprado_manutencao", on_delete= models.CASCADE)
    automovelFK = models.ForeignKey(Automovel, related_name="automovel_manutencao", on_delete=models.CASCADE)
    valor_total = models.DecimalField(max_digits=20, decimal_places=2, null=True, blank= True)
    data = models.DateField(auto_now_add=True)

    def __str__(self):
        return  self.valor_total
    
    def save(self, *args, **kwargs):
        preco = self.c_servicoFK.preco
        produto = self.compradosFK.final
        self.valor_total = preco + produto
        super(Manutencao, self).save(*args, **kwargs)


Porcentagem = [MinValueValidator(0), MaxValueValidator(90)]

class Pagamento(models.Model):
    TIPO = [
        ("Pix", "Pix"),
        ("Boleto", "Boleto"),
        ("CC", "Cartão de credito"),
        ("CD", "Cartão de debito")
    ]

    STATUS = [
        ("P", "Pendente"),
        ("A", "Aprovado"),
        ("C", "Cancelado")
    ]
    c_pagamento = models.CharField(max_length=100, choices=TIPO)
    descricao = models.CharField(max_length=100)
    manutencaoFk = models.ForeignKey(Manutencao, related_name="Manutenção_pagamento", on_delete= models.CASCADE)
    status = models.CharField(max_length=100, choices=STATUS, default= "P")
    desconto = models.DecimalField(max_digits=3, decimal_places=2, default=0, validators=Porcentagem)
    valor_final = models.DecimalField(max_digits=20, decimal_places=2, null=True, blank= True)
    data = models.DateField(auto_now_add=True)
    
    def __str__(self):
        return self.c_pagamento + ", status: " + self.status
    
    def save(self, *args, **kwargs):
        valor_cheio = self.manutencaoFk.valor_total
        decrescimo = valor_cheio * self.Desconto
        self.Valor_final = valor_cheio - decrescimo
        super(Pagamento, self).save(*args, **kwargs)


class Disponibilidade(models.Model):
        Disponivel = [
        ('D', "Disponivel"),
        ('I', 'Indisponivel')
    ]
        dia = models.CharField(max_length=150, choices=Disponivel, default="D")
        manutencaoFK = models.ForeignKey(Manutencao, related_name="Manutenção_disponivel", on_delete= models.CASCADE)

class Reserva(models.Model):
    Posto = [
        ('1', 'Primeiro posto'),
        ('2', 'Segundo posto')
    ]
    disponibilidadeFK = models.ForeignKey(Disponibilidade, related_name="disponibilidade_reserva", on_delete= models.CASCADE)
    AutomovelFK = models.ForeignKey(Automovel, related_name="automovel_reserva", on_delete=models.CASCADE)
    posto = models.CharField(max_length=150, choices=Posto)
    dia_reserva = models.DateField(null=False)

