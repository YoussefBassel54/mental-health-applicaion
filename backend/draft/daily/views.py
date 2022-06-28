from django.shortcuts import render
from requests import request
from .serializers import GoalSerializer, RatingSerializer, DayTweetSerializer, MoodSerializer
from .models import Goal, Rating, Day_Tweet, Mood
from rest_framework.decorators import api_view, permission_classes
from rest_framework import status
from rest_framework.response import Response
from rest_framework.permissions import   IsAuthenticated
import pandas as pd
from django.core import serializers 
import json



#1.Mood Function

"""
{
        "mood": "Sad",
        "date": "2022-05-28T06:00:00Z",
        "user": 1
 }
"""
@api_view(['POST'])
@permission_classes((IsAuthenticated, ))
def Mood_Input(request):
    if request.method == 'POST':
        serializer = MoodSerializer(data= request.data)
        if serializer.is_valid():
            serializer.save()
            return Response('Mood sumbited successfully!', status= status.HTTP_201_CREATED)
        return Response('Invalid Input!', status= status.HTTP_400_BAD_REQUEST)
    else:
        Response('Invalid Request!', status= status.HTTP_400_BAD_REQUEST)

@api_view(['GET'])
@permission_classes((IsAuthenticated, ))
def Get_Mood(request):
    try:
        guest = Mood.objects.filter(user=request.user.id)
    except Mood.DoesNotExists:
        return Response(status=status.HTTP_404_NOT_FOUND)
    serialized_models = serializers.serialize(format='python', queryset=guest)
    serialized_objects = [s['fields'] for s in serialized_models]
    data = [x.values() for x in serialized_objects]
    columns = serialized_objects[0].keys()
    df = pd.DataFrame(data, columns=columns)
    result = df['mood'].value_counts()
    counts = result.to_dict()
    # GET
    if request.method == 'GET':
        # serializer = MoodSerializer(guest,many=True)
        # return Response(serializer.data)
        return Response(counts)
        



#2.Rating Function

"""
{
        "rating": "Good",
        "day": "2022-05-05",
        "user": 1
 }
"""
@api_view(['POST'])
@permission_classes((IsAuthenticated, ))
def Rating_Input(request):
    if request.method == 'POST':
        serializer = RatingSerializer(data= request.data)
        day_to_check = request.POST.get('day')
        if serializer.is_valid():
            flag=Rating.objects.filter(day=day_to_check).exists()
            if flag:
                return Response('Day is already Rated!', status= status.HTTP_400_BAD_REQUEST)
            else:
                serializer.save()
                return Response('Rating sumbited successfully!', status= status.HTTP_201_CREATED)
        return Response('Invalid Input!', status= status.HTTP_400_BAD_REQUEST)
    else:
        Response('Invalid Request!', status= status.HTTP_400_BAD_REQUEST)


@api_view(['GET'])
@permission_classes((IsAuthenticated, ))
def Get_Rating(request):
    try:
        guest = Rating.objects.filter(user=request.user.id)
    except Rating.DoesNotExists:
        return Response(status=status.HTTP_404_NOT_FOUND)
    serialized_models = serializers.serialize(format='python', queryset=guest)
    serialized_objects = [s['fields'] for s in serialized_models]
    data = [x.values() for x in serialized_objects]
    columns = serialized_objects[0].keys()
    df = pd.DataFrame(data, columns=columns)
    result = df['rating'].value_counts()
    counts = result.to_dict()
    # GET
    if request.method == 'GET':
        # serializer = MoodSerializer(guest,many=True)
        # return Response(serializer.data)
        return Response(counts)


#3.Day Tweet Function

"""
{
        "description": "Good",
        "day": "2022-05-05",
        "user": 1
 }
"""

@api_view(['POST'])
@permission_classes((IsAuthenticated, ))
def Tweet_Input(request):
    if request.method == 'POST':
        serializer = DayTweetSerializer(data= request.data)
        day_to_check = request.POST.get('day')
        if serializer.is_valid():
            flag=Day_Tweet.objects.filter(day=day_to_check).exists()
            if flag:
                return Response('Day is already tweeted!', status= status.HTTP_400_BAD_REQUEST)
            else:
                serializer.save()
                return Response('Tweet sumbited successfully!', status= status.HTTP_201_CREATED)
        return Response('Invalid Input!', status= status.HTTP_400_BAD_REQUEST)
    else:
        Response('Invalid Request!', status= status.HTTP_400_BAD_REQUEST)


@api_view(['GET'])
@permission_classes((IsAuthenticated, ))
def Get_Tweet(request):
    try:
        guest = Day_Tweet.objects.filter(user=request.user.id)
    except Day_Tweet.DoesNotExists:
        return Response(status=status.HTTP_404_NOT_FOUND)
    # GET
    if request.method == 'GET':
        serializer = DayTweetSerializer(guest,many=True)
        return Response(serializer.data)




#4.Goal Function
@api_view(['POST'])
# @permission_classes((IsAuthenticated, ))
# @permission_classes((IsAuthenticated, ))
def Goal_Input(request):
    if request.method == 'POST':
        serializer = GoalSerializer(data= request.data)
        if serializer.is_valid():
            serializer.save()
            return Response('Goal sumbited successfully!', status= status.HTTP_201_CREATED)
        return Response('Invalid Input!', status= status.HTTP_400_BAD_REQUEST)
    else:
        Response('Invalid Request!', status= status.HTTP_400_BAD_REQUEST)

@api_view(['GET'])
@permission_classes((IsAuthenticated, ))
def Get_Goal(request):
    try:
        # guest = Goal.objects.filter(user=pk)
        guest = Goal.objects.filter(user=request.user.id)
    except Goal.DoesNotExists:
        return Response(status=status.HTTP_404_NOT_FOUND)
    # GET
    if request.method == 'GET':
        serializer = GoalSerializer(guest,many=True)
        return Response(serializer.data)

@api_view(['GET','PUT','DELETE'])
@permission_classes((IsAuthenticated, ))
def Edit_Goal(request, pk):
    try:
        guest = Goal.objects.filter(pk=pk)
        guest1 = Goal.objects.get(pk=pk)
    except Goal.DoesNotExists:
        return Response(status=status.HTTP_404_NOT_FOUND)
    # GET
    if request.method == 'GET':
        serializer = GoalSerializer(guest,many=True)
        return Response(serializer.data)
    # PUT
    if request.method == 'PUT':
        serializer = GoalSerializer(guest1, data= request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status= status.HTTP_400_BAD_REQUEST)
    # DELETE
    if request.method == 'DELETE':
        guest1.delete()
        return Response(status= status.HTTP_204_NO_CONTENT)