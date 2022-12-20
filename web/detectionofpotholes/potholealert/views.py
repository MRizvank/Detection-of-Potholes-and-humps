from django.shortcuts import render
from django.http import HttpResponse
from potholealert.models import PotholeAlert
from rest_framework.views import APIView
from rest_framework.response import Response
from.serializer import Potholealertserializer

# Create your views here.
def potholealert(request):
    if request.method == "POST":
        obj = PotholeAlert()
        obj.area=request.POST.get("con")
        obj.alert=request.POST.get("pl")
        obj.details=request.POST.get("nm")
        obj.save()
    return render(request,'potholealert/pothole alert.html')
class Poholeview(APIView):

    def get(self,request):
        s=PotholeAlert.objects.all()
        ser=Potholealertserializer(s,many=True)
        return Response(ser.data)

