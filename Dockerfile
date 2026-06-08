# Especificación de la versión según el estándar del proyecto
FROM python:3.14.5-slim

# Variables de entorno para optimizar rendimiento y logs
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Definición del directorio de trabajo
WORKDIR /app

# Instalación de dependencias (fijadas para evitar discrepancias)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia del código fuente y el script de entrada
COPY . .
RUN chmod +x entrypoint.sh

# Punto de entrada que valida el entorno y ejecuta migraciones antes de arrancar
ENTRYPOINT ["./entrypoint.sh"]

# Comando por defecto (puede ser sobrescrito por docker-compose)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]