from django.db import models

# Create your models here.
class AccidentArea(models.Model):
    location = models.CharField(max_length=50)
    details = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'accident_area'

