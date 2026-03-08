#!/bin/bash

INSTALL_DIR="/usr/local/nginx-inspector"

echo "Installing nginx-inspector..."

sudo rm -rf $INSTALL_DIR
sudo rm -rf /etc/systemd/system/nginx-inspector.service

sudo mkdir -p $INSTALL_DIR

sudo cp -r bin $INSTALL_DIR/
sudo cp -r api $INSTALL_DIR/
sudo cp -r web $INSTALL_DIR/

sudo cp service/nginx-inspector.service /etc/systemd/system/
sudo cp bin/nginx-inspector /usr/local/bin/

sudo chmod +x /usr/local/bin/nginx-inspector
sudo chmod +x $INSTALL_DIR/bin/*.sh

if ! command -v python3 &> /dev/null; then
    echo "Python3 not found. Installing..."
    sudo apt update
    sudo apt install -y python3
fi
if ! command -v pip3 &> /dev/null; then
    echo "pip3 not found. Installing..."
    sudo apt update
    sudo apt install -y python3-pip
fi

echo "Installing Python dependencies..."
pip3 install -r requirements.txt

sudo systemctl daemon-reload
sudo systemctl enable nginx-inspector

echo
echo "Installation complete!"
echo "Commands:"
echo "  nginx-inspector start"
echo "  nginx-inspector stop"
echo "  nginx-inspector status"
echo "  nginx-inspector analyze <logfile>"
echo "  nginx-inspector attack <logfile>"
echo "  nginx-inspector api"
echo "  nginx-inspector web"