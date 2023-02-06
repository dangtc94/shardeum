ufw allow ssh
ufw allow 8080
ufw allow https
ufw allow http
ufw allow 443
ufw enable

sleep 1

sudo apt update && apt upgrade -y

sleep 1

sudo apt-get install ca-certificates curl gnupg lsb-release

sleep 1

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

sleep 1

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


sleep 1

sudo chmod a+r /etc/apt/keyrings/docker.gpg
sudo apt-get update

sleep 1

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

sleep 1

sudo apt install docker-compose

sleep 1

curl -O https://gitlab.com/shardeum/validator/dashboard/-/raw/main/installer.sh && chmod +x installer.sh && ./installer.sh

sleep 2

cd $home

cd .shardeum

./shell.sh

operator-cli gui start