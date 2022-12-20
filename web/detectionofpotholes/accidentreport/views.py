from django.shortcuts import render
from django.http import  HttpResponse
from accidentreport.models import AccidentReport
# create your views here.
def postaccidentreport(request):
    if request.method == "POST":
        obj = AccidentReport()
        obj.date = request.POST.get("nm")
        obj.area = request.POST.get("con")
        obj.time = request.POST.get("pl")
        obj.vehicle_code = request.POST.get("tl")
        obj.save()

    return render(request,'accidentreport/accident report in.html')
def viewaccidentreport(request):
    objlist = AccidentReport.objects.all()
    context = {
        'objval': objlist,
    }
    return render(request,'accidentreport/accident report out.html',context)
def posttrafficaccidntrprt(request):
    if request.method == "POST":
        obj = AccidentReport()
        obj.date = request.POST.get("nm")
        obj.area = request.POST.get("con")
        obj.time = request.POST.get("pl")
        obj.vehicle_code = request.POST.get("tl")
        obj.save()
    return render(request,'accidentreport/trafficaccidntrprt.html')
