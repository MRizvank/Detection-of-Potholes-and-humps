from django.conf.urls import url
from registration import views
urlpatterns=[
    url('registration/',views.registration),
    url('traffic_reg/',views.traffic_registration),
    url('emerg_reg/',views.emergency_reg),
    url('^android/',views.Postview.as_view()),
]