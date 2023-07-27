#!/bin/bash -e

Help()
{
   # Display Help
   echo "Script help."
   echo
   echo "Syntax: ./script.sh <compiler> <optimization_flag> <microarchitecture_flag>"
   echo "<compiler> - path to a compiler"
   echo "<optimization_flag> - level of optimization (one should use a flag, i'e "-O3" or "-O0")"
   echo "<microarchitecture_flag> - target's microarchitecture_flag (one should use a flag, i.e "-march=riscv64")"
   echo
}

while getopts ":h" option; do
   case $option in
      h) # display Help
         Help
         exit;;
   esac
done

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
        IFS='_' read -r -a ADDR <<< "$assemblyFile"

        instructionName="${ADDR[0]}"
        instructionName="${instructionName:2}"

        assemblyText=$( cat "$assemblyFile" ) 
        
        if echo "$assemblyText" | grep -q -w "$instructionName"; then
            echo -e "${GREEN}$assemblyFile, passed${NC}\n";
            instructionsFound=$((instructionsFound+1))
            echo "$assemblyFile, passed" >> ../../results.txt
        else
            echo -e "${RED}$assemblyFile, not passed${NC}\n";
            echo "$assemblyFile, not passed" >> ../../results.txt
        fi
    done
    cd ".."
done

cd ".."

echo "Tests passed, $instructionsFound out of $filesTotal"

echo "Assembly files with bitmanip instrcutions, $instructionsFound out of $filesTotal" >> results.txt
