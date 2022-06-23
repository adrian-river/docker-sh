#!/bin/bash 

let contenedor=1
echo -e "============================ \n Bienvenido que desea hacer?"
echo -e "\n - Por favor consulte mi repostorio para saber los parametros disponibles"
echo -e "\n - https://github.com/adrian-river/docker-sh \n"

echo "iniciar sesion en dockerHUB..."
			sudo docker login

while true; do
	echo -e "coloque un parametro \n"	
	read parametro
	case $parametro in
		exit) break 
		;;
		images)
			sudo docker images
		;;
		ps)
			sudo docker ps
		;;
		deploy)
			echo "indique el nombre que desee colocar a su contenedor"
			read container
			echo "indique el nombre de la imagen que desea ejecutar"
			read image
			if [ -n $container ]; then
				sudo docker run --rm -d -p 8000:80 --name $container $image
				let contenedor=0
			fi
		;;
		version)
			if [ $contenedor -eq 0 ]; then
				sudo docker stop $container
				echo "se detuvo el anterior contenedor"
				let contenedor=1
			fi
			echo "indique el nombre de usuario de dockerHUB"
			read user
			echo "coloque el nombre y el tag de su imagen local (hola:1.0.0)"
			read image_local

			echo "coloque el nombre que desea colocarle a su nueva imagen y su nueva tag (hola:1.0.1)"
			read image_vr
			sudo docker tag $image_local $image_vr
			echo $image_vr
			sleep 5s
			sudo docker push $image_vr
			echo -e "\n su imagen se ha subido a su repositorio ejecute el parametro ´deploy´ para ejecutar su contenedor "
		;;
		rollback)
			echo $contenedor
			if [ $contenedor -eq 0 ]; then
				sudo docker stop $container
				sudo docker stop $container_roll
				let contenedor=1
			fi
			echo "indique el nombre que desee colocar a su contenedor"
			read container_roll
			echo "indique el nombre de la imagen que desea ejecutar"
			read image_roll
			echo "coloque el tag en el que desea volver"
			read tag_roll
			if [ -n $container_roll ]; then
				sudo docker run --rm -d -p 8000:80 --name $container_roll $image_roll:$tag_roll
				let contenedor=0
				echo $contenedor
			fi
		;;	
	esac	
done		
