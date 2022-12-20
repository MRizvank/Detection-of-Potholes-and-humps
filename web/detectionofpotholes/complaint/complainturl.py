from django.conf.urls import url
from complaint import views
urlpatterns =[
    url('^postcomplaint/',views.postcomplaint),
    url('viewcomplaint/',views.viewcomplaint),
    url('trafficcomplaint/',views.trafficcomplaint),
    url('post_reply/(?P<idd>\w+)',views.post_reply,name="post_reply"),
    url('reject/(?P<idd>\w+)',views.reject,name='reject'),
    url('t_reply/(?P<idd>\w+)',views.t_reply,name="t_reply"),
    url('^android/',views.Compview.as_view()),
    # url('^android2/',views.Compview.as_view()),
    # url('t_reject/(?P<idd>\w+)',views.t_reject,name='t_reject'),
]