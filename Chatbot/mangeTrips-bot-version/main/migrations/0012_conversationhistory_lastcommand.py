# Generated by Django 4.2.5 on 2024-02-22 23:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0011_conversationhistory_conversation'),
    ]

    operations = [
        migrations.AddField(
            model_name='conversationhistory',
            name='lastCommand',
            field=models.CharField(blank=True, max_length=30, null=True),
        ),
    ]
