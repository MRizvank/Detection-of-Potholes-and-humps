from django.shortcuts import render
from django.http import HttpResponse
from accidentalert.models import AccidentAlert
# Create your views here.
def accidentalert(request):
    objlist = AccidentAlert.objects.all()
    context = {
        'objval': objlist,
    }
    return render(request,'accidentalert/accidentalert.html',context)
