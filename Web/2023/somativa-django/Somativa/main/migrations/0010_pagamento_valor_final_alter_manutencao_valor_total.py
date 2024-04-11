# Generated by Django 4.2.4 on 2023-10-08 18:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0009_alter_produto_valor_venda'),
    ]

    operations = [
        migrations.AddField(
            model_name='pagamento',
            name='Valor_final',
            field=models.DecimalField(blank=True, decimal_places=2, max_digits=100, null=True),
        ),
        migrations.AlterField(
            model_name='manutencao',
            name='Valor_total',
            field=models.DecimalField(blank=True, decimal_places=2, max_digits=100, null=True),
        ),
    ]