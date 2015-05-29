#!/bin/sh

cd src/BareMetal-OS/programs/
rustc -O -C no-redzone --crate-type lib -o $1.o --emit obj $1.rs &&
    ld -T app.ld -o ../../../bin/$1.app $1.o #&&
    # objdump -d $1.o

echo '#########################'

if [ $? -eq 0 ]; then
    cd ../../../bin
    ./bmfs bmfs.image create $1.app 1
    ./bmfs bmfs.image write $1.app
    cd ..
else
    echo "Error"
fi
