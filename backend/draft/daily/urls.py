from django.urls import path,include
from .views import Mood_Input, Get_Mood, Rating_Input, Get_Rating, Tweet_Input, Get_Tweet, Goal_Input, Get_Goal, Edit_Goal
# router.register('mood', viewsets_mood,basename='Mood')

urlpatterns = [
    path('mood/',Mood_Input),
    path('mood/user/', Get_Mood),
    path('rating/',Rating_Input),
    path('rating/user/', Get_Rating),
    path('tweet/',Tweet_Input),
    path('tweet/user/', Get_Tweet),
    path('goal/',Goal_Input),
    path('goal/user/', Get_Goal),
    path('goal/edit/<int:pk>', Edit_Goal),
]
