from django.shortcuts import render
from django.http import HttpResponse
from complaint.models import Complaint,Trafficcomplaint

from rest_framework.views import APIView
from rest_framework.response import Response
from .serializer import Complaintserializer

# Create your views here.
def postcomplaint(request):
    if request.method == "POST":
        obj = Complaint()
        obj.user_id = request.POST.get("usr")
        obj.date = request.POST.get("nm")
        obj.replay = request.POST.get("rep")
        obj.complaint = request.POST.get("com")
        obj.save()

    return render(request,'complaint/complaints in.html')
def viewcomplaint(request):
    objlist = Complaint.objects.all()
    context = {
        'objval': objlist,
    }
    return render(request,'complaint/complaints out.html',context)
def trafficcomplaint(request):
    objlist = Trafficcomplaint.objects.all()
    context = {
        'objval': objlist,
    }

    return render(request,'complaint/trafficcomplaint.html',context)



def post_reply(request,idd):
    if request.method == "POST":
      obj=Complaint.objects.get(id=idd)
      obj.replay = request.POST.get("reply")
      obj.save()
      return viewcomplaint(request)
    return render(request,'complaint/admin_rply.html')



def reject(request,idd):
    obj = Complaint.objects.get(id=idd)
    obj.replay = 'rejected'
    obj.save()
    return viewcomplaint(request)

def t_reply(request,idd):
    if request.method == "POST":
      obj=Trafficcomplaint.objects.get(id=idd)
      obj.reply = request.POST.get("reply")
      obj.save()
      return trafficcomplaint(request)
    return render(request,'complaint/t_reply.html')



# def t_reject(request,idd):
#     obj = Trafficcomplaint.objects.get(id=idd)
#     obj.reply = 'rejected'
#     obj.save()
#     return trafficcomplaint(request)
import datetime

class Compview(APIView):

    def get(self,request):
        s=Complaint.objects.all()
        ser=Complaintserializer(s,many=True)
        return Response(ser.data)

    def post(self, request):
        obj = Complaint()
        obj.user_id = request.data["uid"]
        obj.date = datetime.date.today()
        obj.complaint = request.data["comp"]
        obj.replay = 'pending'
        obj.save()
        return HttpResponse("ok")