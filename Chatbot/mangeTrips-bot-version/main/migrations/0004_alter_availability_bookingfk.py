# Generated by Django 4.2.5 on 2023-09-30 21:56

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0003_rename_diaria_trip_daily'),
    ]

    operations = [
        migrations.AlterField(
            model_name='availability',
            name='bookingFK',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='bookingAvailability', to='main.booking'),
        ),
    ]
