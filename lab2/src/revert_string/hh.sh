gcc -c  main.c    -o static/main.o
gcc -c  revert_string.c    -o static/revert_string.o
gcc -c -fPIC main.c    -o shared/main.o
gcc -c -fPIC revert_string.c    -o shared/revert_string.o
ar rcs static/libtq84.a static/main.o static/revert_string.o
gcc   main.o  -Lstatic -ltq84 -o statically-linked


gcc -shared shared/main.o shared/revert_string.o -o shared/libtq84.so
gcc  main.o -Lshared -ltq84 -o use-shared-library
LD_LIBRARY_PATH=$(pwd)/
export LD_LIBRARY_PATH



//4 задание
gcc -shared revert_string.o -o libRevertD.so
gcc tests.c -L$(pwd) -lRevertD -o revertTests -lcunit