from django.db import models
from django.contrib.auth import get_user_model

User=get_user_model()

# 1.Goal Table
class Goal(models.Model):

    STATUS_CHOICES = (('Unfinished', 'Unfinished'),('Finished', 'Finished'))
    CATEGORY_CHOICES = (('Work', 'Work'),('Hangout', 'Hangout'),('Chores', 'Chores'))

    title = models.CharField(max_length=50)
    start = models.DateTimeField()
    end = models.DateTimeField()
    status = models.CharField(max_length=10, choices=STATUS_CHOICES)
    description = models.CharField(max_length=255)
    remind_me = models.BooleanField()
    category = models.CharField(max_length=10, choices=CATEGORY_CHOICES)
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='goal')

    def __str__(self):
        return f"{self.user} ({self.title})"



# 2.Rating Table
class Rating(models.Model):

    RATING_CHOICES = (('Great', 'Great'),('Good', 'Good'),('Ok', 'Ok'),('Poor', 'Poor'),('Bad', 'Bad'))


    rating = models.CharField(max_length=10, choices=RATING_CHOICES)
    day = models.DateField()
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='rating')

    def __str__(self):
        return f"{self.user} ({self.rating})"

    

 # 3.Day_Tweet Table   
class Day_Tweet(models.Model):

    description = models.CharField(max_length=255)
    day = models.DateField()
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='day_tweet')

    def __str__(self):
        return f"{self.user} ({self.day})"


 # 4.Mood Table 
class Mood(models.Model):

    MOOD_CHOICES = (('Happy', 'Happy'),('Sad', 'Sad'),('Tired', 'Tired'),('Stressed', 'Stressed'),
    ('Angry', 'Angry'),('Shy', 'Shy'),('Grumpy', 'Grumpy'),('Scared', 'Scared'),('Worried', 'Worried'),
    ('Hurt', 'Hurt'),('Okay', 'Okay'),('Good', 'Good'))

    mood = models.CharField(max_length=20, choices=MOOD_CHOICES)
    date = models.DateTimeField()
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='mood')

    def __str__(self):
        return f"{self.user} ({self.mood},{self.date.strftime('%m-%d-%y')})"