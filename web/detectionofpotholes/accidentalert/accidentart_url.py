from  django.conf.urls import url
from accidentalert import views
urlpatterns=[
    url('^viewaccidentalert/',views.accidentalert),
]