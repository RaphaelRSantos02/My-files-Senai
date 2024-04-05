# Generated by Django 4.2.4 on 2023-10-08 17:56

import django.core.validators
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0006_reserva'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='reserva',
            name='Date',
        ),
        migrations.AddField(
            model_name='reserva',
            name='Data',
            field=models.DateField(auto_now_add=True, default=django.utils.timezone.now),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='reserva',
            name='manutencaoFK',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='manunteção_reserva', to='main.manutencao'),
        ),
        migrations.AlterField(
            model_name='pagamento',
            name='Desconto',
            field=models.DecimalField(decimal_places=2, default=0, max_digits=4, validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(90)]),
        ),
        migrations.AlterField(
            model_name='pagamento',
            name='ManutencaoFk',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='Manutenção_pagamento', to='main.manutencao'),
        ),
    ]
