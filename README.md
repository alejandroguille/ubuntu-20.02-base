# Ubuntu-20.02-base
 Base docker para instalar y crear un usuario de sistema con acceso a SSH server.

# Uso
 Descargcar Dockerfile
 docker build . --tag alejandroguille/ubuntu-20.04-base --build-arg USER='USERNAME' --build-arg PASS='PASSWORD' 
 docker run --publish 22 --name ubuntu-20.02 alejandroguille/ubuntu-20.04-base

# Incluye
-Docker
-Docker Compose
