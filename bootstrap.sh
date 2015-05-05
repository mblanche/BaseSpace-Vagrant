## Setting up the repo keys for apt-get
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF

## Adding new repos to our apt-get list
echo "deb https://get.docker.io/ubuntu docker main"  | sudo tee /etc/apt/sources.list.d/docker.list
echo "deb http://download.mono-project.com/repo/debian wheezy/snapshots/3.12.0 main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list
echo "deb http://basespace-apt.s3.amazonaws.com spacedock main" | sudo tee -a /etc/apt/sources.list

# updating/upgrading the OS
export DEBIAN_FRONTEND=noninteractive && sudo apt-get -q -y update
export DEBIAN_FRONTEND=noninteractive && sudo apt-get -q -y upgrade

## Installing the SpaceDock required software and my favorite text editor
sudo apt-get install -q -y --force-yes lxc-docker-1.5.0 mono-complete spacedock emacs24-nox

## Enabling communiation of the docker over HTTP
echo  'DOCKER_OPTS="-d -H tcp://0.0.0.0:4243 -H unix:///var/run/docker.sock"' | sudo tee -a /etc/default/docker

## restarting docker
sudo service docker restart

