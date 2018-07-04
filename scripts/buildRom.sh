#!/bin/bash

#
# uso:
# > ./buildRom.sh asm/archivo.asm
#
# agrega todas las rutinas en asm/routines al
# final del archivo asm/archivo.asm
# y traduce este resultado a verilog.
#

# escribir el archivo en un archivo temporal
cat $1 > temp.asm

# para cada rutina, agregar al archivo temporal
for filename in ./asm/routines/*.asm; do
  echo "
" >> temp.asm
  cat $filename >> temp.asm
done

# traducir el asm a verilog
node scripts/translate.js temp.asm Verilog/Module_ROM.v

# eliminar archivo temporal
rm temp.asm
