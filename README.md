# infra-devops

Author: Alexandre CAROL

## Structure du projet

```
infra-devops/
  terraform/
    versions.tf
    main.tf
    variables.tf
    outputs.tf
  app/
    package.json
    server.js
    Dockerfile
  README.md
```

## 📋 Prérequis

- Terraform
- Docker Engine / Docker Desktop
- Git
- `curl`

## Lancer le projet

```bash
cd terraform
terraform init
terraform plan
terraform apply
```

### Outputs:
```
api_url = "http://localhost:8080"
adminer_url = "http://localhost:8081"
network_name = "my-app-network"
```

## 🔌 Routes de l'API

Une fois lancée, l'API écoute sur le port configué (8080 par défaut) :

| Route | Méthode | Réponse | Description |
|-------|---------|---------|-------------|
| `/` | GET | `{"message":"API running in development environment"}` | Message de bienvenue |
| `/health` | GET | `{"status":"ok"}` | Vérifier que l'API fonctionne |

### Tester les routes

```bash
# Vérifier l'API
curl http://localhost:8080/health

# Voir le message
curl http://localhost:8080/
```

## Arrêter le projet

```bash
terraform destroy
```