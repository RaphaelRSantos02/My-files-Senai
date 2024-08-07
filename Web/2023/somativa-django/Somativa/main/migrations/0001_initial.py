# Generated by Django 4.2.4 on 2023-10-14 21:25

from django.conf import settings
import django.core.validators
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Automovel',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('categoria', models.CharField(choices=[('Moto', 'Moto'), ('Carro', 'Carro'), ('Caminhão', 'Caminhão')], max_length=200)),
                ('marca', models.CharField(max_length=100)),
                ('modelo', models.CharField(max_length=200)),
                ('ano', models.IntegerField(blank=True, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='C_servico',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('servico', models.CharField(max_length=200)),
                ('preco', models.DecimalField(decimal_places=2, max_digits=100)),
            ],
        ),
        migrations.CreateModel(
            name='CustomUser',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('email', models.CharField(max_length=50)),
                ('telefone', models.IntegerField(validators=[django.core.validators.MaxValueValidator(9)])),
                ('cpf', models.IntegerField(validators=[django.core.validators.MaxValueValidator(11)])),
                ('classificacao', models.CharField(choices=[('C', 'Cliente'), ('F', 'Funcionario'), ('A', 'Admin')], default='C', max_length=50)),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Disponibilidade',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('dia', models.CharField(choices=[('D', 'Disponivel'), ('I', 'Indisponivel')], default='D', max_length=150)),
            ],
        ),
        migrations.CreateModel(
            name='Manutencao',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('valor_total', models.DecimalField(blank=True, decimal_places=2, max_digits=20, null=True)),
                ('data', models.DateField(auto_now_add=True)),
                ('CustomFK', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='CustomUser_manutencao', to='main.customuser')),
                ('automovelFK', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='automovel_manutencao', to='main.automovel')),
                ('c_servicoFK', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='c_servico_manutencao', to='main.c_servico')),
            ],
        ),
        migrations.CreateModel(
            name='Produto',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nome', models.CharField(max_length=150)),
                ('cod_fabricante', models.IntegerField()),
                ('qtd_estoque', models.IntegerField()),
                ('nome_fabricante', models.CharField(max_length=150)),
                ('valor_compra', models.DecimalField(decimal_places=2, max_digits=100)),
                ('valor_venda', models.DecimalField(decimal_places=2, max_digits=100, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Reserva',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('posto', models.CharField(choices=[('1', 'Primeiro posto'), ('2', 'Segundo posto')], max_length=150)),
                ('dia_reserva', models.DateField()),
                ('AutomovelFK', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='automovel_reserva', to='main.automovel')),
                ('disponibilidadeFK', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='disponibilidade_reserva', to='main.disponibilidade')),
            ],
        ),
        migrations.CreateModel(
            name='Produtos_comprados',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('qtd', models.IntegerField(validators=[django.core.validators.MinValueValidator(1)])),
                ('final', models.DecimalField(blank=True, decimal_places=2, max_digits=20, null=True)),
                ('produtoFK', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='Produtos_comprado', to='main.produto')),
            ],
        ),
        migrations.CreateModel(
            name='Pagamento',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('c_pagamento', models.CharField(choices=[('Pix', 'Pix'), ('Boleto', 'Boleto'), ('CC', 'Cartão de credito'), ('CD', 'Cartão de debito')], max_length=100)),
                ('descricao', models.CharField(max_length=100)),
                ('status', models.CharField(choices=[('P', 'Pendente'), ('A', 'Aprovado'), ('C', 'Cancelado')], default='P', max_length=100)),
                ('desconto', models.DecimalField(decimal_places=2, default=0, max_digits=3, validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(90)])),
                ('valor_final', models.DecimalField(blank=True, decimal_places=2, max_digits=20, null=True)),
                ('data', models.DateField(auto_now_add=True)),
                ('manutencaoFk', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='Manutenção_pagamento', to='main.manutencao')),
            ],
        ),
        migrations.AddField(
            model_name='manutencao',
            name='compradosFK',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='Produtos_comprado_manutencao', to='main.produtos_comprados'),
        ),
        migrations.AddField(
            model_name='disponibilidade',
            name='manutencaoFK',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='Manutenção_disponivel', to='main.manutencao'),
        ),
    ]
