import os
import sys

REQUIRED_ENV_VARS = [
    'SECRET_KEY',
    'DATABASE_URL',
]

def check_environment():
    missing_vars = [var for var in REQUIRED_ENV_VARS if not os.getenv(var)]
    
    if missing_vars:
        print(f"ERROR: Faltan variables de entorno obligatorias: {', '.join(missing_vars)}")
        sys.exit(1) # Detiene el contenedor si no están presentes
    
    print("Sanity check pasado: Todas las variables obligatorias están presentes.")

if __name__ == "__main__":
    check_environment()