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

# Get doctors list
@api_view(['GET'])

def FBV_List(request):
    # GET
    doctors = doctorlist.objects.all()
    serializer = DoctorSerializer(doctors, many=True)
    return Response(serializer.data)


#get individual doctor description and rating
@api_view(['GET'])

def doc_indv(request,pk):
    # GET
   doctor = doctorlist.objects.get(pk=pk)
   serializer = individualdocSerializer(doctor)
   return Response(serializer.data)

#di viewset hat5alini a get w a post fabassel w howa beya5od el api ye5tar el post bas
#book session, ba5tar duration and date
class book_session(viewsets.ModelViewSet):

    queryset = reservation.objects.all()

    serializer_class = reservationSerializer


#upcoming sessions
@api_view(['GET'])
def sessions(request):

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
def Historysessions(request):

    try:
        guest = reservation.objects.filter(guest=request.user.id,date__lt=datetime.now())
    except reservation.DoesNotExists:
        return Response(status=status.HTTP_404_NOT_FOUND)

# GET

    if request.method == 'GET':
        serializer = reservationSerializer(guest,many=True)
        return Response(serializer.data)


    # POST
    elif request.method == 'POST':
        serializer = ratingcSerializer(data= request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status= status.HTTP_201_CREATED)
        return Response(serializer.data, status= status.HTTP_400_BAD_REQUEST)

