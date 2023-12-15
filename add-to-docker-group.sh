#! /bin/bash -x

# adding current user to docker's user group, so you don't have to call "sudo" every time using docker

sudo usermod -a -G docker "$USER"
