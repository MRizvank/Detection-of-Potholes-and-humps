from django.db import models

# Create your models here.
class AccidentAlert(models.Model):
    area = models.CharField(max_length=50)
    alert = models.CharField(max_length=25)

    class Meta:
        managed = False
        db_table = 'accident_alert'
