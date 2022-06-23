from django.contrib import admin
from .models import Goal, Rating, Day_Tweet, Mood

# Register your models here.

admin.site.register(Goal)
admin.site.register(Rating)
admin.site.register(Day_Tweet)
admin.site.register(Mood)