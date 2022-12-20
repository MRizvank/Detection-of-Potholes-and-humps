from rest_framework import serializers
from .models import PotholeAlert
class Potholealertserializer(serializers.ModelSerializer):
    class Meta:
        model=PotholeAlert
        fields='__all__'