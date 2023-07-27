#!/bin/bash -e
echo "Microarchitecture, $3
Compiler, $1
Optimization level, $2" > results.txt

cd "./cFiles"

GREEN='\033[0;32m' 
RED='\033[0;31m' 
NC='\033[0m'

filesTotal=0
instructionsFound=0

if echo "$1" | grep -q -w "gcc"; then
    toolChain="$1 $3 $2 -S";
else 
    toolChain="$1  --target=riscv64-unknown-elf $3 $2 -S"
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
            echo "$assemblyFile, passed" >> ../../results.txt
        else
            echo -e "${RED}$instructionName was not found in $assemblyFile ${NC}\n";
            echo "$assemblyFile, not passed" >> ../../results.txt
        fi
    done
    cd ".."
done

cd ".."


echo "Assembly files with bitmanip instrcutions, $instructionsFound out of $filesTotal" >> results.txt