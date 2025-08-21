#!/bin/bash

sudo apt update
sudo apt install nodejs npm
sudo apt install postgresql postgresql-contrib
sudo systemctl start postgresql
sudo systemctl enable postgresql