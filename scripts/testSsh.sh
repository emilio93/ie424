#!/bin/bash

dt=$(date '+%d-%m-%Y--%H-%M-%S');

# nombre seguro para evitar choques
# utiliza la fecha y hora actual
folder=ie424temporal$dt
# crear folder en home
cd
mkdir $folder
cd $folder

# obtener proyecto
git clone git@gitlab.com:labo-digitales-i/minialu.git .

workingDir="$(pwd)"
# probar la simulacion/síntesis
ise $workingDir/minialu/minialu.xise

# salir y eliminar folder
cd ..
rm -rf $folder
