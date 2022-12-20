from django.db import models

# Create your models here.
class AccidentReport(models.Model):
    date = models.DateField()
    time = models.TimeField()
    vehicle_code = models.CharField(max_length=25)
    area = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'accident_report'


