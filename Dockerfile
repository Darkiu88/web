# imagen base
FROM python:3.12-slim

#Directorio del proyecto 
WORKDIR /app

# Copiar los archivos del proyecto al contenedor
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# copiar el resto del codigo 
COPY . . 

# Exponer el puerto 
EXPOSE 8000 

#Comando por defecto (iniciar django)
CMD ["gunicorn", "core.wsgi:application", "--bind", "0.0.0.0:8000"]