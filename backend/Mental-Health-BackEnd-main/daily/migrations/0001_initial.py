# Generated by Django 4.0.5 on 2022-06-10 16:33

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Rating',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('rating', models.CharField(choices=[('Great', 'Great'), ('Good', 'Good'), ('Ok', 'Ok'), ('Poor', 'Poor'), ('Bad', 'Bad')], max_length=10)),
                ('day', models.DateField()),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='rating', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Mood',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('mood', models.CharField(choices=[('Happy', 'Happy'), ('Sad', 'Sad'), ('Tired', 'Tired'), ('Stressed', 'Stressed'), ('Angry', 'Angry'), ('Shy', 'Shy'), ('Grumpy', 'Grumpy'), ('Scared', 'Scared'), ('Worried', 'Worried'), ('Hurt', 'Hurt'), ('Okay', 'Okay'), ('Good', 'Good')], max_length=20)),
                ('date', models.DateTimeField()),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='mood', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Goal',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=50)),
                ('start', models.DateTimeField()),
                ('end', models.DateTimeField()),
                ('status', models.CharField(choices=[('Unfinished', 'Unfinished'), ('Finished', 'Finished')], max_length=10)),
                ('description', models.CharField(max_length=255)),
                ('remind_me', models.BooleanField()),
                ('category', models.CharField(choices=[('Work', 'Work'), ('Hangout', 'Hangout'), ('Chores', 'Chores')], max_length=10)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='goal', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Day_Tweet',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('description', models.CharField(max_length=255)),
                ('day', models.DateField()),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='day_tweet', to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
