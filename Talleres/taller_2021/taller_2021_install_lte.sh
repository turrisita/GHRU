##ubuntu os
###optional from raw###
##wget https://releases.ubuntu.com/20.04.1/ubuntu-20.04.1-desktop-amd64.iso?_ga=2.153152376.1561314401.1605891057-2011375140.1605891057
##update ubuntu and install requiered dependencies
sudo apt-get update; sudo apt-get install -y wget curl default-jre default-jdk vim
##remove old version of dcoker 
sudo apt-get remove docker docker-engine docker.io containerd runc
##docker
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common 
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - 
sudo apt-get fingerprint 0EBFCD88 
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get install docker-ce docker-ce-cli containerd.io 
##docker GHRU images
sudo docker pull bioinformant/ghru-assembly:1.5.5
sudo docker pull bioinformant/ghru-mlst:1.0
sudo docker pull bioinformant/ghru-amr-prediction:1.0
sudo docker pull bioinformant/ghru-snp-phylogeny:1.2.2
sudo docker images
##nextflow
wget -qO- https://get.nextflow.io | bash
sudo mv nextflow /bin/
sudo chmod +x /bin/nextflow
nextflow -v
##git_clone_GHRU_pipelines and scripts
sudo apt-get install git-all
mkdir nextflow_pipelines
cd nextflow_pipelines
git clone https://gitlab.com/cgps/ghru/pipelines/assembly.git
git clone https://gitlab.com/cgps/ghru/pipelines/mlst.git
git clone https://gitlab.com/cgps/ghru/pipelines/amr_prediction.git
git clone https://gitlab.com/cgps/ghru/pipelines/snp_phylogeny.git
git clone https://gitlab.com/cgps/ghru/scripts.git
##docker_certificates
##sudo groupadd docker
sudo usermod -aG docker ${USER}
newgrp docker
