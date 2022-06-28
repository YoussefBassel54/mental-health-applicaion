from datetime import datetime
from unicodedata import name
from urllib.request import Request
from django.shortcuts import render
from pytz import timezone
from rest_framework import generics, mixins, viewsets
from .models import reservation
from django.db.models.lookups import GreaterThan, LessThan
from doctors.models import doctorlist
from rest_framework.decorators import api_view
from django.http.response import JsonResponse
from rest_framework.response import Response
from rest_framework import status, filters
from django.http import Http404
from .serializers import DoctorSerializer,individualdocSerializer,reservationSerializer,sessionSerializer,ratingcSerializer
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import   IsAuthenticated

# Get doctors list
@api_view(['GET'])
#@permission_classes((IsAuthenticated, ))
def FBV_List(request):
    try:
        guest = doctorlist.objects.all()
    except doctorlist.DoesNotExists:
        return Response(status=status.HTTP_404_NOT_FOUND)
    # GET
    doctors = doctorlist.objects.all()
    serializer = DoctorSerializer(doctors, many=True)
    return Response(serializer.data)


#get individual doctor description and rating
@api_view(['GET'])
@permission_classes((IsAuthenticated, ))
def doc_indv(request,pk):
    try:
        guest = doctorlist.objects.filter(user=request.user.id)
    except doctorlist.DoesNotExists:
        return Response(status=status.HTTP_404_NOT_FOUND)
    # GET
    doctor = doctorlist.objects.get(pk=pk)
    serializer = individualdocSerializer(doctor)
    return Response(serializer.data)

#di viewset hat5alini a get w a post fabassel w howa beya5od el api ye5tar el post bas
#book session, ba5tar duration and date
#@permission_classes((IsAuthenticated, ))
#class book_session(viewsets.ModelViewSet):
#    queryset = reservation.objects.all()
#
#    serializer_class = reservationSerializer


#upcoming sessions
@api_view(['GET'])
@permission_classes((IsAuthenticated, ))
def sessions(request):
    #try:
     #   guest = doctorlist.objects.filter(user=request.user.id)
    #except doctorlist.DoesNotExists:
     #   return Response(status=status.HTTP_404_NOT_FOUND)

    try:
        guest = reservation.objects.filter(guest=request.user.id,date__gte=datetime.now())
    except reservation.DoesNotExists:
        return Response(status=status.HTTP_404_NOT_FOUND)

# GET

    if request.method == 'GET':
        serializer = reservationSerializer(guest,many=True)
        return Response(serializer.data)


#Previous sessions
@api_view(['GET','POST'])
@permission_classes((IsAuthenticated, ))
def Historysessions(request):

    try:
        guest = reservation.objects.filter(guest=request.user.id,date__lte=datetime.now())
    except reservation.DoesNotExists:
        return Response(status=status.HTTP_404_NOT_FOUND)

# GET

    if request.method == 'GET':
        #try:
         #   guest = doctorlist.objects.filter(user=request.user.id)
        #except doctorlist.DoesNotExists:
         #   return Response(status=status.HTTP_404_NOT_FOUND)
        serializer = reservationSerializer(guest,many=True)
        return Response(serializer.data)


    # POST
    elif request.method == 'POST':
        serializer = ratingcSerializer(data= request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status= status.HTTP_201_CREATED)
        return Response(serializer.data, status= status.HTTP_400_BAD_REQUEST)


@api_view(['POST'])
@permission_classes((IsAuthenticated, ))
def Session_Input(request):
    if request.method == 'POST':
        serializer = reservationSerializer(data= request.data)
        day_to_check = request.data['date']
        print(day_to_check)
        if serializer.is_valid():
            flag=reservation.objects.filter(date=day_to_check).exists()
            if not(flag):
                serializer.save()
                return Response('Session Booked successfully!', status= status.HTTP_201_CREATED)
            else:
                return Response('Session Date is not avaiable!', status= status.HTTP_400_BAD_REQUEST)
        return Response('Invalid Input!', status= status.HTTP_400_BAD_REQUEST)
    else:
        Response('Invalid Request!', status= status.HTTP_400_BAD_REQUEST)