# Deploy

## Requisitos
- Nginx
- Docker Engine CE
- Dokku
- SSH Key
- Github Actions
- Let's Encrypt


## Instalacion

### Nginx

Es importante instalar la version oficial de nginx que proporciona http://nginx.org/en/linux_packages.html ya que Ubuntu mantiene una version desactualizada.

Nginx tiene como propósito el ser servidor frontal y balanceador de cargas de la aplicación, a diferencia de la misma aplicación Nginx tiene un motor optimizado para trabajar mas eficiente.

```bash
sudo apt install curl gnupg2 ca-certificates lsb-release

echo "deb http://nginx.org/packages/debian `lsb_release -cs` nginx" \
    | sudo tee /etc/apt/sources.list.d/nginx.list

curl -fsSL https://nginx.org/keys/nginx_signing.key | sudo apt-key add -

sudo apt update

sudo apt install nginx
```

### Docker Engine CE

Docker Engine CE de ahora en adelanta sera mencionado como `Docker` es el gestor de contenedores de Linux, la aplicación tiene en la raíz del proyecto un archivo de configuración llamado `Dockerfile` donde tiene escritas instrucciones para empaquetar la aplicación a una imagen de contenedor.

```bash
sudo apt-get update

sudo apt-get install \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg-agent \
  software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
```

### Dokku

Es un proyecto open source que hace la función de `PaaS` muy similar a `Heroku` este proyecto integra el servicio de `Nginx` para balancear las cargas de trabajo entre contenedores.


```bash
wget https://raw.githubusercontent.com/dokku/dokku/v0.23.0/bootstrap.sh
sudo DOKKU_TAG=v0.23.0 bash bootstrap.sh
```

Debemos crear un proyecto de Dokku con el siguiente comando:

```
dokku apps:create inventory
```

### SSH Key

Se debe generar un par de llaves publica y privada, estas llaves se deben generar en la maquina local con los siguientes comandos:

```bash
openssl genrsa -out rsa.private 1024
openssl rsa -in rsa.private -out rsa.public -pubout -outform PEM
```

Se crearan 2 archivos uno llamado `rsa.private` y `rsa.public`.

En `https://github.com/USERNAME/REPO/settings/secrets` se deben generar un  secret con el nombre de `SSH_PRIVATE_KEY` y su respectivo valor debe ser el contenido de `rsa.private`.

El archivo `rsa.public` se debe copiar en el servidor y se debe ejecutar el siguiente comando:

```bash
sudo dokku ssh-keys:add github rsa.public
```