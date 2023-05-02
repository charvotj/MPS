#!/bin/bash

cp projekt.cir temp.cir

echo ".control" >> temp.cir
echo "exit" >> temp.cir
echo ".endc" >> temp.cir

# clear old output files
rm -f tex/data/d/* tex/data/d-teplota1/* tex/data/d-teplota2/* tex/data/e/output.csv tex/data/temp/*
    
ngspice temp.cir
rm temp.cir

sleep 2

cd tex
latex --interaction=nonstopmode mps-projekt.tex
biber mps-project
latex --interaction=nonstopmode mps-projekt.tex