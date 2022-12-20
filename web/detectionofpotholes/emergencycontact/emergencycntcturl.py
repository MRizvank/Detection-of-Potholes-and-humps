from django.conf.urls import url
from  emergencycontact import views
urlpatterns=[
    url('^postemergencycontact/',views.postemergencycontact),
    url('^viewemergencycontact/',views.viewemergencycontact),
    url('^postemergencycontact_ad/',views.postemergencycontact_ad),
    url('^android/',views.Emgview.as_view()),

]