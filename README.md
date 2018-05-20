# MiniALU

MiniALU is the codebase for the IE-0424 course.

The purpose is for the students to develop a set of projects based on this
codebase.

## Experimento 3

Se implementa un controlador para la LCD de la tarjeta de desarrollo Spartan3e starter kit. Este controlador es utilizado en la MiniAlu, donde se ha habilitado el uso de subrutinas.

Para obtener el proyecto se puede utilizar el siguiente script. Abre el proyecto en ise, una vez cerrado el programa se eliminan todos los archivos del proyecto(incluyendo el proyecto). Se puede omitir el último bloque para no eliminar el proyecto.

```
folder=temporalie424

# crear folder en home
cd
mkdir $folder
cd $folder

# obtener proyecte e ir a experimento 3
git clone git@gitlab.com:labo-digitales-i/minialu.git .
git checkout experimento3

workingDir="$(pwd)"
# probar la simulacion/síntesis
ise $workingDir/minialu/minialu.xise

# salir y eliminar folder
cd ..
rm -rf $folder
```
