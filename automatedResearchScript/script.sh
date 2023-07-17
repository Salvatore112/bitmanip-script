#!/bin/bash -e
cd "$1"

for folder in ./*
do
    cd "$folder"
    
    for cFile in ./*.c
    do
       /home/pasha/x-tools/riscv64-unknown-elf/bin/riscv64-unknown-elf-gcc \
        -march=rv64gc_zba_zbb_zbc_zbs "$cFile" "$2" -S 
    done

    for assemblyFile in ./*.s
    do
    
        assemblyText=$( cat "$assemblyFile" ) 
        instructions=("cpopw" "add.uw" "andn" "clmul" "clmulh" "clmulr" "clz" "clzw" "cpop" "ctz" "ctzw" "max" "rev8" "maxu" "min" "minu" "orc.b" "orn" "rol" "rolw" "ror" "rori" "roriw" "rorw" "bclr" "bclri" "bext" "bexti" "binv" "binvi" "bset" "bseti" "sext.b" "sext.h" "sh1add" "sh1add.uw" "sh2add" "sh2add.uw" "sh3add" "sh3add.uw" "slli.uw" "xnor" "zext.h")

        for instruction in "${instructions[@]}"
        do
            if echo "$assemblyText" | grep -q -w "$instruction"; then
                echo "$key was found in $assemblyFile";
            fi
        done
    done
    cd ".."
done
