# docker-sh

## instrucciones:

<ol>
  <li>Crear o logearte en una cuenta de Docker Hub</li>
  <li>tener instalado Docker</li>
  <li>crear un archivo Dockerfile en cualquier directorio y ejecutar <code>sudo docker build -t "image-name" .</code> </li>
  <li>ejecutar el comando <code>./dockerSH.sh</code></li>
</ol>

nota: no es necesario pasarle al archivo un parametro se colocan despues de colocar <code>./dockerSH.sh</code>


## Parametros:

<ul>
  <li>stop</li>
  <li>sp</li>
  <li>images</li>
  <li>deploy</li>
  <li>version</li>
  <li>rollback</li>
</ul>

# Definicion de parametro:

<ul>
  <li>stop === <strong> sirve como un docker stop (detener un contenedor)</strong></li>
  <li>sp === <strong> sirve como un docker ps (ver contenedores) </strong></li>
  <li>images === <strong> sirve como un docker images (ver imagenes)</strong></li>
  <li>deploy === <strong>se ejecuta un docker run </strong></li>
  <li>version === <strong>se crea un tag y se pusea a dockerHub</strong></li>
  <li>rollback === <strong>se ejecuta un run con una version especifica</strong></li>
   === <strong>se ejecuta un <code>docker run</code> con una version especifica y se puede volver a colocar y eliminara el anterior contenedor con el mismo nombre</strong>
</ul>
