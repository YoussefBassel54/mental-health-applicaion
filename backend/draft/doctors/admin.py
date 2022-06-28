from django.contrib import admin
from .models import availability, doctorlist, reservation,Rating
# Register your models here.
admin.site.register(doctorlist)
admin.site.register(reservation)
admin.site.register(availability)
admin.site.register(Rating)

