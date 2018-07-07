# MiniALU

MiniALU is the codebase for the IE-0424 course.

The purpose is for the students to develop a set of projects based on this
codebase.

## Experimento Final

Juego en que el jugador salta obstaculos.

### Obteniendo el Proyecto

Para obtener el proyecto, utilizar:

```bash
cd
git clone git@gitlab.com:labo-digitales-i/minialu.git
git checkout Experimento_final
cd minialu
ise minialu/minialu.xise
```

### Probando Cambios en el Proyecto

#### Cambios en el Código Ensamblador

Se puede trabajar proyectos enteros utilizando únicamente
código ensamblador, por lo que se provee una utilidad para
generar un módulo en verilog que funciona en el proyecto, facilitando la tarea de programar el código ensamblador.

En la carpeta ```asm``` se encuentran los diferentes programas en ensamblador, estos utilizan las rutinas en ```asm/routines```, que se incluyen indistintamente en el módulo generado.

Para generar el módulo, utilizar:

```bash
cd
cd minialu
./scripts/buildRom.sh asm/main.asm
```

Esto concatena el contenido en ```main.asm``` y las rutinas en la carpeta ```asm/routines```, transforma lo obtenido en el módulo en ```Verilog/Module_ROM.v```.

#### Funcionamiento de Manera Sistemática

Una vez con el proyecto se puede probar cualquier tag o branch
en el repositrio remoto. De la siguienta manera, por ejemplo,
se puede probar que el trabajo local *commiteado* funciona de
manera sistemática de la siguiente manera:

```bash
cd
cd minialu
git branch Mi-branch-de-prueba
git checkout Mi-branch-de-prueba
git push
./scripts/test.ssh # muestra uso y ejemplos
./scripts/test.ssh ssh Mi-branch-de-prueba

```

Con esto se prueba el funcionamiento del proyecto con ise, se abre ise
con el proyecto cargado y listo para correr la síntesis o simulación.
El script se encarga de eliminar los archivos generados y descargados.

### Organización del Proyecto

- asm: Programas en ensamblador.
  - routines: Rutinas en ensamblador.
- gtkw: Configuraciones de onda para GTKWave.
- minialu: Archivo del proyecto en ise y otros generados por ise.
- Pruebas: Testbenchs en Verilog.
- scripts: Utilidades para trabajo en el Proyecto.
- Verilog: Código verilog del proyecto.
- wcfg: Configuraciones de onda para Isim.
- Minialu.ucf: Configuración de Pines.

## Experimento 3

Se implementa un controlador para la LCD de la tarjeta de desarrollo Spartan3e starter kit. Este controlador es utilizado en la MiniAlu, donde se ha habilitado el uso de subrutinas.

Para obtener el proyecto se puede utilizar el siguiente script. Abre el proyecto en ise, una vez cerrado el programa se eliminan todos los archivos del proyecto(incluyendo el proyecto). Se puede omitir el último bloque para no eliminar el proyecto.

```bash
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
