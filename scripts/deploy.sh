#!/bin/bash
APP_DIR="/var/www/html"
sudo mkdir -p $APP_DIR/instancia1 $APP_DIR/instancia2
sudo cp app/index1.html $APP_DIR/instancia1/index.html
sudo cp app/index2.html $APP_DIR/instancia2/index.html


