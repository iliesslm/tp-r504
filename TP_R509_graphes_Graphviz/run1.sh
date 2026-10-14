#!/bin/bash
tool=neato
if [ $# -ne 1 ]; then
    echo "Erreur : argument manquant (nom du fichier sans .dot)"
    exit 1
fi
$tool -Tpng $1.dot >$1.png
$tool -Tsvg $1.dot >$1.svg
