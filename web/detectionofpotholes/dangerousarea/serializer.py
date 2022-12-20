from rest_framework import serializers
from .models import DangerousArea
class Dangerousareaserializer(serializers.ModelSerializer):
    class Meta:
        model=DangerousArea
        fields='__all__'