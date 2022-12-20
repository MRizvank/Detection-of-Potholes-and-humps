from django.shortcuts import render
from django.http import HttpResponse
from login.models import Login
from rest_framework.views import APIView
from rest_framework.response import Response
from.serializer import Loginserializer

# Create your views here.
def login(request):
    if request.method == "POST":
       username = request.POST.get("usr")
       password = request.POST.get("pss")
       obj = Login.objects.filter(username=username, password=password)
       tp = ""
       for ob in obj:
           tp = ob.type
           uid = ob.id
           if tp == "admin":
               request.session['uid'] = uid
               return render(request,'login/Adminhome.html')
           elif tp == 'traffic':
               request.session['uid'] = uid
               return render(request, 'login/Trafficpolicehome.html')

           elif tp=="emergency":
               request.session['uid'] = uid
               return render(request, 'login/Emergencyservicehome.html')
           else:
               return render(request, 'login/login.html')



    return render(request,'login/login.html')


class Loginview(APIView):
    def get(self,request):
        s=Login.objects.all()
        ser=Loginserializer(s,many=True)
        return Response(ser.data)
    def post(self,request):
        unm = request.data['unm']
        pa = request.data['pa']
        obj = Login.objects.filter(username=unm,password=pa)
        ser = Loginserializer(obj,many=True)
        return Response(ser.data)
