#!/bin/bash

function use () {
  echo "Use:"
  echo "	./scripts/test.ssh [ssh|https] [|branch|tags/tag]"
  echo ""
  echo "Examples:"
  echo "	./scripts/test.ssh ssh # clona con ssh, utiliza branch master"
  echo "	./scripts/test.ssh https # clona con https, utiliza branch master"
  echo "	./scripts/test.ssh ssh Experimento_final # utiliza branch Experimento_final"
  echo "	./scripts/test.ssh https Experimento_final # utiliza branch Experimento_final"
  echo "	./scripts/test.ssh ssh tags/experimento3 # utiliza tag experimento3"
}

if [ -z "$1" ]; then
  echo "No inputs"
  echo ""
  use
  exit 1;
fi

if [ $1 = "ssh" ]; then
  echo "ssh selected"
  IE424GITDIR=git@gitlab.com:labo-digitales-i/minialu.git
elif [ $1 = "https" ]; then
  IE424GITDIR=https://gitlab.com/labo-digitales-i/minialu.git
  echo "https selected"
else
  echo "Wrong inputs"
  echo ""
  use
  exit 1;
fi
echo ""

# nombre seguro para evitar choques
# utiliza la fecha y hora actual
dt=$(date '+%d.%m.%Y.%H.%M.%S');
folder=ie424temporal$dt

# crear folder en home
cd
echo "mkdir $folder"
mkdir $folder
echo "cd $folder"
cd $folder

echo "pwd"
pwd
echo ""

# obtener proyecto
echo "git clone $IE424GITDIR ."
git clone $IE424GITDIR .

# checkout el branch solicitado
if [ -z "$2" ]; then
  echo "Selected branch: Master"
else
  echo "Selected branch: $2"
  echo "git checkout $2"
  git checkout $2
fi
echo ""

workingDir="$(pwd)"
# probar la simulacion/síntesis
ise $workingDir/minialu/minialu.xise

# salir y eliminar folder
cd ..
echo "pwd"
pwd
echo ""

echo "rm -rf $folder"
rm -rf $folder
