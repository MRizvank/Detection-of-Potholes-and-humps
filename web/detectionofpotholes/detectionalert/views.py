from django.shortcuts import render
from django.http import HttpResponse
from detectionalert.models import DetectionAlert
from rest_framework.views import APIView
from rest_framework.response import Response
from.serializer import Detectionalertserializer
# Create your views here.
def postdetectionalert(request):
    if request.method == "POST":
        obj = DetectionAlert()
        obj.area = request.POST.get("ar")
        obj.alert = request.POST.get("AL")
        obj.details = request.POST.get("dt")
        obj.save()

    return render(request,'detectionalert/detection alert.html')

class Alertview(APIView):
    def get(self,request):
        s=DetectionAlert.objects.all()
        ser=Detectionalertserializer(s,many=True)
        return Response(ser.data)