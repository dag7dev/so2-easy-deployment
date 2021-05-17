#!/bin/bash
# Copyright (C) 2021  Damiano "dag7" Gualandri

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
#along with this program.  If not, see <https://www.gnu.org/licenses/>.


mat=$1
ngrader=$2
es=$3

year1="2020"
year2="2021"

printhelp() {
	echo -e "\n
	Uso: ./deploy.sh matricola ngrader es
	\t matricola = la tua matricola
	\t ngrader = il numero del grader, 1 o 2 (a seconda dell'homework
	\t es = il numero dell'esercizio che hai fatto. Se tutti scrivi \"all\""
	
	if [ ! $1 = "-h" ]; then
		echo "Per ulteriori informazioni digitare -h come primo parametro in caso di problemi."
	fi	
}

if [ $1 = "-h" ]; then
	printhelp
	
	echo -e "
	Questo script serve a testare gli homework di SO2 in maniera semplice, evitando di copiare e creare file manualmente.
	Crea un file zippato pronto per la consegna che puoi trovare in grader.<graderNumber>
	Al momento funziona ed è testato solo per l'homework 2.
	
	-------
	Q: gli anni della cartella che mi crea sono sbagliati, cosa posso fare?
	A:In caso di necessita', e' necessario settare a mano gli anni nel quale si sta eseguendo l'homework nello script, cambiando manualmente i parametri year1 e year2
	\n
	Q: ho eseguito lo script senza file, non funziona nulla. Che succede?
	A: questo script deve trovarsi in una cartella con: grader.<graderNumber> e cartelle con gli homework dentro (es. 1)\n
	Esempio dopo aver eseguito ls: 1  deploy.sh  grader.2

	Leggi il README di Github per tutto il resto: https://github.com/dag7dev/so2-easy-deployment
	-------

	Settare il deployment è importante, ricordati di lasciare una stella su Github se lo script ti è stato utile!
	"
	exit 1
fi

if [ -z $1 ]; then
	echo "Matricola vuota. Specificare matricola e riprovare"
	printhelp
	exit 1
fi

if [ -z $2 ]; then
	echo "Numero grader mancante. Specifica un numero da 1 a 2"
	printhelp
	exit 1
fi

if [ -z $3 ]; then
    echo "Numero esercizio vuoto. Specifica un numero da 1 a 3"
	printhelp
    exit 1
fi

folder="so2.$year1.$year2.$ngrader.$mat"

[ ! -d "1" ] && mkdir "$folder"

rm -rf "$folder"/*

if [ "$es" = "all" ]; then
	[ ! -d "1" ] && echo "Directory 1 non esistente. Assicurati di avere una directory chiamata 1 e riprova" && exit 1
	cp -r 1 "$folder"

	[ ! -d "2" ] && echo "Directory 2 non esistente. Assicurati di avere una directory chiamata 2 e riprova" && exit 1
	cp -r 2 "$folder"

	[ ! -d "3" ] && echo "Directory 3 non esistente. Assicurati di avere una directory chiamata 3 e riprova" && exit 1
	cp -r 3 "$folder"
else
	[ ! -d "$es" ] && echo "Directory $es non esistente. Assicurati di avere una directory chiamata $es e riprova" && exit 1
	cp -r "$es" "$folder"
fi

cd "$folder"
tar cfz "$folder".tgz [1-3]

[ ! -d "../grader.$ngrader" ] && echo "Directory grader non esistente. Assicurati di avere una directory chiamata grader.$ngrader e riprova" && exit 1

mv "$folder".tgz ../grader."$ngrader"/
cd ../grader."$ngrader"
./grader."$ngrader".sh "$es"
cd ..
