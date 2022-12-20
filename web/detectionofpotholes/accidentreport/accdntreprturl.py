from django.conf.urls import url
from accidentreport import views
urlpatterns =[
    url('^postaccidentreport/',views.postaccidentreport),
    url('^viewaccidentreport/',views.viewaccidentreport),
    url('^posttrafficaccidntrprt/',views.posttrafficaccidntrprt),


]