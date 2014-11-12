Author  : CarbonSphere <br>
Email   : carbonsphere@gmail.com<br>


<h2>Dockerfile for building docker image. This Base image is based on CentOS6 with LEMP services (Nginx,PHP-FPM) </h2>

<h4>Steps for creating image from Dockerfile and running procedure:</h4>

<b>1 :</b> Clone docker-centos6-php-nginx.git
<pre>
<b>Command: </b>
git clone https://github.com/carbonsphere/docker-centos6-php-nginx.git
</pre>

<b>2 :</b> Build docker image from Dockerfile
<pre>
<b>Command: </b>
#Change Directory
cd CentOS6-PHP-Nginx

#Build Image
sudo docker build -t #YOUR_IMAGE_NAME# .
#ex:  sudo docker build -t youraccount/centos6_php_nginx .
</pre>

<b>3 :</b> Run image
<pre>
<b>Command: </b>
sudo docker run -d -P youraccount/centos6_php_nginx 

</pre>

<b>4 :</b> Run image
<pre>
<b>Command: </b>
sudo docker run -d -P --name web youraccount/centos6_php_nginx 

#docker_daemon_ip#:#image_port#
docker_daemon_ip can be found using "boot2docker ip" or you can check your environment variable "echo $DOCKER_HOST"
image_port can be found using "docker port web"

</pre>
