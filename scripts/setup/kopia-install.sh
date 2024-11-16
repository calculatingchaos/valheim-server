#!/bin/sh

## Install Kopia CLI
# ref: https://kopia.io/docs/installation/#linux-installation-using-apt-debian-ubuntu
curl -s https://kopia.io/signing-key | sudo gpg --dearmor -o /etc/apt/keyrings/kopia-keyring.gpg
echo "deb [signed-by=/etc/apt/keyrings/kopia-keyring.gpg] http://packages.kopia.io/apt/ stable main" | sudo tee /etc/apt/sources.list.d/kopia.list
sudo apt update
sudo apt install kopia

echo "installation complete; reference the following url for guidance on how to use Kopia"
echo "https://kopia.io/docs/getting-started/#kopia-cli"
