from datetime import date
from django.db import models
from django.core.validators import MaxValueValidator, MinValueValidator
from django.contrib.auth import get_user_model

User=get_user_model()


class availability(models.Model):
    date = models.DateTimeField()

    def __str__(self):
        return f"{self.date}"



#doctors database including name, specialty,session price, image,description,ratings
class doctorlist (models.Model):
    name = models.CharField(max_length=10, default=None,null=True)
    specialty = models.CharField(max_length=50,default=None,null=True)
    session_price= models.IntegerField(default=None,null=True)

    #ana mesh 3arfa el sowar di saved fen w eh blog images dol hahahaha
    image= models.ImageField(blank=True, upload_to='blog_images',default=None,null=True)
    #img= models.ImageField(upload_to=None, height_field=None, width_field=None, max_length=100)

    description = models.CharField(max_length=300,default=None,null=True)
    #stars = models.ManyToManyField(Rating)
    #rating= models.IntegerField(validators=(MinValueValidator(0), MaxValueValidator(5)),default=None,null=True)
    freetime = models.ManyToManyField(availability)


    def __str__(self):
        return f"{self.name}"

    ...



class reservation (models.Model):
    date= models.DateTimeField()
    DURATION_CHOICES = (('30mins', 'halfhour'),('1', 'onehour'),('2', 'twohour'))
    duration = models.CharField(max_length=10, choices=DURATION_CHOICES)

    guest= models.ForeignKey(User,related_name='appointments', on_delete=models.CASCADE)
    doctor= models.ForeignKey(doctorlist,related_name='appointments', on_delete=models.CASCADE)

    def __str__(self):
        return f"Reservation {self.id}"




class Rating(models.Model):
    rate= models.IntegerField(validators=(MinValueValidator(0), MaxValueValidator(5)))
    guest= models.ForeignKey(User,related_name='doctor_rating', on_delete=models.CASCADE)
    doctor= models.ForeignKey(doctorlist, on_delete=models.CASCADE)

    def __str__(self):
         return f"Rating {self.id}"


#lama ye5tar ma3ad w wa2t mo3ayan mayenfa3sh 7ad tani ye5aro


