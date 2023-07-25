#!/bin/bash -e
cd "$1"

GREEN='\033[0;32m' 
RED='\033[0;31m' 
NC='\033[0m'

filesTotal=0
instructionsFound=0

toolChain="w"

if echo "$2" | grep -q -w "gcc"; then
    toolChain="$2 -march=rv64gc_zba_zbb_zbc_zbs $3 -S";
else 
    toolChain="$2  --target=riscv64-unknown-elf -march=rv64gc_zba_zbb_zbc_zbs $3 -S"
fi

for folder in ./*
do
    cd "$folder"
    
    for cFile in ./*.c
    do
        $toolChain "$cFile"
    done

    for assemblyFile in ./*.s
    do
        filesTotal=$((filesTotal+1))
        IFS='_' read -a ADDR <<< "$assemblyFile"

        instructionName="${ADDR[0]}"
        instructionName="${instructionName:2}"

        assemblyText=$( cat "$assemblyFile" ) 
        
        if echo "$assemblyText" | grep -q -w "$instructionName"; then
            echo -e "${GREEN}$instructionName was found in $assemblyFile ${NC}\n";
            instructionsFound=$((instructionsFound+1))
        else
            echo -e "${RED}$instructionName was not found in $assemblyFile ${NC}\n";
        fi
    done
    cd ".."
done

cd ".."

summary="Architecture, placeholder
Compiler, $2
Optimization level, $3 
Assembly files with bitmanip instrcutions, $instructionsFound out of $filesTotal"

echo "$summary" > results.txt
