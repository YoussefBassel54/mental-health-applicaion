from rest_framework import serializers
from .models import Goal, Rating, Day_Tweet, Mood


class GoalSerializer(serializers.ModelSerializer):
    class Meta:
        model = Goal
        fields = '__all__'

class RatingSerializer(serializers.ModelSerializer):
    class Meta:
        model = Rating
        fields = '__all__'
        
class DayTweetSerializer(serializers.ModelSerializer):
    class Meta:
        model = Day_Tweet
        fields = '__all__'

class MoodSerializer(serializers.ModelSerializer):
    class Meta:
        model = Mood
        fields = '__all__'