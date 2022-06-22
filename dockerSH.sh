#!/bin/bash 

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
		version)
			echo "indique el nombre de usuario de dockerHUB"
			read user
			echo "coloque el nombre de su imagen local"
			read image_local
			echo "coloque el tag de la imagen local"
			read tag
			echo "coloque el nombre que desea colocarle a su contenedor y su nueva tag (hola:1.0.1)"
			echo -n "$user/"
			read image_vr
			sudo docker tag $image_local:$tag $image_vr
			sudo docker images
		;;
		deploy)
			echo "indique el nombre que desee colocar a su contenedor"
			read container
			echo "indique el nombre de la imagen que desea ejecutar"
			read image
			if [ -n $container ]; then
				echo $container $image
				sudo docker run --rm -d -p 8000:80 --name $container $image
			fi
		;;
		newdeploy)
			echo "se creara una nueva version en $image_vr. desea continuar? (y/n)"
			read repuesta
			if [ $repuesta = "y" ] || [ $repuesta = "yes" ]; then
				echo "coloque el nombre que desea colocarle a su contenedor y su nueva tag (hola:1.0.1)"
				echo -n "$user/"
				read NEW_image_vr
				sudo docker tag $image_vr $NEW_image_vr
			fi
		;;
	esac	
done		
