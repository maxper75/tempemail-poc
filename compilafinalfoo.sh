#!/bin/bash
gcc -fpic -c finalFoo.c -I '/usr/include/pgsql/server'
gcc -shared -o finalFoo.so finalFoo.o -lcurl

