from django.contrib import admin
from django.urls import path,include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('user/',include('authentication.urls')),
    path('daily/',include('daily.urls')),
    path('doctor/',include('doctors.urls'))
]
