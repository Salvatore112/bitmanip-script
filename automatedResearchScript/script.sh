cd "$1"

for folder in ./*
do
    cd "$folder"
    for cFile in ./*.c
    do
    /home/pasha/x-tools/riscv64-unknown-elf/bin/riscv64-unknown-elf-gcc -march=rv64gc_zba_zbb_zbc_zbs "$cFile" "$2" -S 
    done
    cd ".."
done

for folder in ./*
do
    cd "$folder"
    for assemblyFile in ./*.s
    do
    assemblyText=$( cat "$assemblyFile" ) 
    
    if echo "$assemblyText" | grep -q -w "add.uw"; then
        echo "add.uw was found in $assemblyFile";
    fi
    
    if echo "$assemblyText" | grep -q -w "andn"; then
        echo "andn was found in $assemblyFile";
    fi
    
    if echo "$assemblyText" | grep -q -w "clmul"; then
        echo "clmul was found in $assemblyFile";
    fi
    
    if echo "$assemblyText" | grep -q -w "clmulh"; then
        echo "clmulh was found in $assemblyFile";
    fi

    if echo "$assemblyText" | grep -q -w "clmulr"; then
        echo "clmulr was found in $assemblyFile";
    fi

    if echo "$assemblyText" | grep -q -w "clz"; then
        echo "clz was found in $assemblyFile";
    fi

    if echo "$assemblyText" | grep -q -w "clz"; then
        echo "clz was found in $assemblyFile";
    fi

    if echo "$assemblyText" | grep -q -w "clzw"; then
        echo "clzw was found in $assemblyFile";
    fi

    if echo "$assemblyText" | grep -q -w "cpop"; then
        echo "cpop was found in $assemblyFile";
    fi

    if echo "$assemblyText" | grep -q -w "cpopw"; then
        echo "cpopw was found in $assemblyFile";
    fi

    if echo "$assemblyText" | grep -q -w "ctz"; then
        echo "ctz was found in $assemblyFile";
    fi

    if echo "$assemblyText" | grep -q -w "ctzw"; then
        echo "ctzw was found in $assemblyFile";
    fi

    if echo "$assemblyText" | grep -q -w "max"; then
        echo "max was found in $assemblyFile";
    fi

    if echo "$assemblyText" | grep -q -w "maxu"; then
        echo "maxu was found in $assemblyFile";
    fi

    if echo "$assemblyText" | grep -q -w "min"; then
        echo "min was found in $assemblyFile";
    fi

    if echo "$assemblyText" | grep -q -w "minu"; then
        echo "minu was found in $assemblyFile";
    fi

    if echo "$assemblyText" | grep -q -w "orc.b"; then
        echo "orc.b was found in $assemblyFile";
    fi

    if echo "$assemblyText" | grep -q -w "orn"; then
        echo "orn was found in $assemblyFile";
    fi

    if echo "$assemblyText" | grep -q -w "rev8"; then
        echo "rev8 was found in $assemblyFile";
    fi

    if echo "$assemblyText" | grep -q -w "rol"; then
        echo "rol was found in $assemblyFile";
    fi

    if echo "$assemblyText" | grep -q -w "rolw"; then
        echo "rolw was found in $assemblyFile";
    fi

    if echo "$assemblyText" | grep -q -w "ror"; then
        echo "ror was found in $assemblyFile";
    fi

    if echo "$assemblyText" | grep -q -w "rori"; then
        echo "rori was found in $assemblyFile";
    fi
    
    if echo "$assemblyText" | grep -q -w "roriw"; then
        echo "roriw was found in $assemblyFile";
    fi

    if echo "$assemblyText" | grep -q -w "rorw"; then
        echo "rorw was found in $assemblyFile";
    fi

    if echo "$assemblyText" | grep -q -w "bclr"; then
        echo "bclr was found in $assemblyFile";
    fi

    if echo "$assemblyText" | grep -q -w "bclri"; then
        echo "bclri was found in $assemblyFile";
    fi

    if echo "$assemblyText" | grep -q -w "bext"; then
        echo "bext was found in $assemblyFile";
    fi

    if echo "$assemblyText" | grep -q -w "bexti"; then
        echo "bexti was found in $assemblyFile";
    fi

    if echo "$assemblyText" | grep -q -w "binv"; then
        echo "binv was found in $assemblyFile";
    fi

    if echo "$assemblyText" | grep -q -w "binvi"; then
        echo "binvi was found in $assemblyFile";
    fi

    if echo "$assemblyText" | grep -q -w "bset"; then
        echo "bset was found in $assemblyFile";
    fi

    if echo "$assemblyText" | grep -q -w "bseti"; then
        echo "bseti was found in $assemblyFile";
    fi

    if echo "$assemblyText" | grep -q -w "sext.b"; then
        echo "sext.b was found in $assemblyFile";
    fi

    if echo "$assemblyText" | grep -q -w "sext.h"; then
        echo "sext.h was found in $assemblyFile";
    fi

    if echo "$assemblyText" | grep -q -w "sh1add"; then
        echo "sh1add was found in $assemblyFile";
    fi

    if echo "$assemblyText" | grep -q -w "sh1add.uw"; then
        echo "sh1add.uw was found in $assemblyFile";
    fi

    if echo "$assemblyText" | grep -q -w "sh2add"; then
        echo "sh2add was found in $assemblyFile";
    fi

    if echo "$assemblyText" | grep -q -w "sh2add"; then
        echo "sh2add was found in $assemblyFile";
    fi

    if echo "$assemblyText" | grep -q -w "sh2add.uw"; then
        echo "sh2add.uw  was found in $assemblyFile";
    fi

    if echo "$assemblyText" | grep -q -w "sh3add"; then
        echo "sh3add was found in $assemblyFile";
    fi

    if echo "$assemblyText" | grep -q -w "sh3add.uw"; then
        echo "sh3add.uw was found in $assemblyFile";
    fi

    if echo "$assemblyText" | grep -q -w "slli.uw"; then
        echo "slli.uw was found in $assemblyFile";
    fi

    if echo "$assemblyText" | grep -q -w "xnor"; then
        echo "xnor was found in $assemblyFile";
    fi

    if echo "$assemblyText" | grep -q -w "zext.h"; then
        echo "zext.h was found in $assemblyFile";
    fi
    done
    cd ".."
done
