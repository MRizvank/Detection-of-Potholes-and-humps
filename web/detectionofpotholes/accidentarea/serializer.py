from rest_framework import serializers
from .models import AccidentArea
class Accidentareaserializer(serializers.ModelSerializer):
    class Meta:
        model=AccidentArea
        fields='__all__'