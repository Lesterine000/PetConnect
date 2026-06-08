#!/bin/sh
# entrypoint.sh

# 1. Validar variables de entorno críticas (Sanity Check)
python config/check_env.py

# 2. Aplicar migraciones para asegurar integridad antes de iniciar el servicio
echo "Aplicando migraciones..."
python manage.py migrate --noinput

# 3. Iniciar el proceso principal
exec "$@"