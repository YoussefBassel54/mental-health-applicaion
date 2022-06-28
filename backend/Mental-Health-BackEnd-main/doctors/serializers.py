from email.mime import image
from unicodedata import name
from rest_framework import serializers
from doctors.models import doctorlist,reservation, availability,Rating

class DoctorSerializer(serializers.ModelSerializer):
    class Meta:
        model = doctorlist
        fields = ('image', 'name', 'specialty','session_price','description','id')



class individualdocSerializer(serializers.ModelSerializer):
    class Meta:
        model = doctorlist
        fields = ('image', 'name', 'rating','description','availability')

class ratingcSerializer(serializers.ModelSerializer):
    class Meta:
        model = doctorlist
        fields = '__all__'

class reservationSerializer(serializers.ModelSerializer):

    class Meta:
        model = reservation
        fields = '__all__'




class sessionSerializer(serializers.ModelSerializer):
    class Meta:
        model = doctorlist
        fields = ('image','name', 'specialty','availability')


class availabilitySerializer(serializers.ModelSerializer):

    class Meta:
        model = availability
        fields = '__all__'
