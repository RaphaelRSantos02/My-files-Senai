# Generated by Django 4.2.5 on 2024-02-19 23:59

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('main', '0010_alter_booking_comment'),
    ]

    operations = [
        migrations.CreateModel(
            name='ConversationHistory',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateField(auto_now_add=True)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='userHistory', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Conversation',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('type', models.CharField(choices=[('Q', 'Question'), ('A', 'Answer')], max_length=10)),
                ('message', models.CharField(max_length=3000)),
                ('date', models.DateField(auto_now_add=True)),
                ('history', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='history', to='main.conversationhistory')),
            ],
        ),
    ]
