#!/bin/bash

cd arch_mate

git pull

find -name PKGBUILD -execdir mksrcinfo \;
aurbuild -a <(aurqueue *) -c -d custom -r /home/vm/custom -p /home/vm/custom


