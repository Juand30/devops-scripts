# DevOps Scripts – Entorno Personalizado de Automatización ⚙️🐳☁️

Este repositorio contiene scripts personales diseñados para automatizar tareas comunes en entornos Linux, Docker y Kubernetes (incluyendo Minikube). 
El objetivo es facilitar la creación y configuración de entornos de desarrollo o pruebas. 
Especialmente en instancias nuevas como EC2 o máquinas virtuales locales.

## 📁 Estructura del repositorio

scripts/
├── setup_server.sh                # Instala Docker, Git y herramientas básicas
├── apply_with_minikube_check.sh   # Verifica y aplica manifiestos YAML en Minikube
└── otros_script.sh                # Próximamente...


## 🚀 Cómo usar

1. **Concede permisos de ejecución**:
   ```bash
   chmod +x scripts/*.sh

2. **Ejecuta un script**:

sudo ./scripts/setup_server.sh
./scripts/apply_with_minikube_check.sh deployment.yaml


🛠️ Requisitos
- Ubuntu 20.04+
- Minikube y kubectl instalados
- Acceso sudo


🧩 Notas
- Estos scripts están en evolución mientras avanzo en mi formación DevOps.
- Todo feedback, forks o mejoras son bienvenidos.
