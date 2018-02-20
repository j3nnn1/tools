

1 - Descargar la imagen del repo hub docker:
docker pull j3nnn/nonolabs

2 - Consultar la imagen descargada:
docker images

3 - Build image
docker build nonolabs

4 - Create container from image
docker run --detach=true --hostname=nonolabs --interactive=true --tty=true --name=nonolabs j3nnn/nonolabs:latest

4 - start container
docker start nonolabs

5 - login container:
docker attach nonolabs  
#CTRL-p CTRL-q detach a container and keep running
#CTRL-c => stop a container

docker exec -t -i nonolabs bash

** Eliminar una imagen: docker rmi  -f 6a1f371111c1
** Eliminar un container previo build, docker rm containerName
