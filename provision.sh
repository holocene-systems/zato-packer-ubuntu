sleep 30
sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    curl \
    git \
    htop \
    libcurl4-openssl-dev \
    redis-server \
    software-properties-common \
    ssh \
    wget \
    sudo \
    supervisor \
    vim \
    libpq-dev \
    gnupg \
    libsasl2-dev \
    libldap2-dev \
    libssl-dev


curl -s https://zato.io/repo/zato-3.2-48849AAD40BCBB0E.pgp.txt | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://zato.io/repo/stable/3.2/ubuntu $(lsb_release -cs) main"

sudo apt-get update

sudo apt-get install -y zato 

#cd /opt/zato/current  &&  git pull && ./update.sh

sudo su - zato -c "zato --version"
