# Adding the basepace repo to the apt-get list
echo deb http://basespace-apt.s3.amazonaws.com spacedock main | sudo tee -a /etc/apt/sources.list

# updating/upgrading the OS
export DEBIAN_FRONTEND=noninteractive
sudo apt-get -qq -y update
sudo apt-get -qq -y upgrade

## Installing emacs and perl
sudo apt-get install -qq -y emacs24-nox

# Installing the packages (and my favorite text editor)
sudo apt-get install -qq -y --force-yes mono-complete docker.io

# Linking the apt-get installed mono to /usr/local/bin
sudo ln -s /usr/bin/mono /usr/local/bin/mono

## Installing SpaceDock
sudo apt-get install -qq -y --force-yes spacedock

# Configuring docker
echo  'DOCKER_OPTS="-d -H tcp://0.0.0.0:4243 -H unix:///var/run/docker.sock"' | sudo tee -a /etc/default/docker.io 

# Updating security keys
sudo mozroots --machine --import --sync

# Restarting docker and spacedock services
sudo service docker.io restart