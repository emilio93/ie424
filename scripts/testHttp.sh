folder=temporalie424

# crear folder en home
cd
mkdir $folder
cd $folder

# obtener proyecte e ir a experimento 3
git clone https://gitlab.com/labo-digitales-i/minialu.git .
git checkout experimento3

workingDir="$(pwd)"
# probar la simulacion/síntesis
ise $workingDir/minialu/minialu.xise

# salir y eliminar folder
cd ..
rm -rf $folder
