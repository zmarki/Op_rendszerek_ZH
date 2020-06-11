#!/bin/bash

if ! [ $# -eq 1 ]; then
	echo "Egynél több paramétert adott meg, vagy nem adott meg parametert"
	echo "./run.sh <fájlnév>"
	exit 1
fi

if ! echo $1 | grep -e "\.log$" >> /dev/null; then
	echo "nem .log ra végzödik a fájl"
	echo "./run.sh <fajlnév>.log"
	exit 1
fi

if ! [ -r $1 ]; then
        echo "nem olvashato a fájl"
        exit 2
fi

for honap in {04..10}
        do
                if expr `grep -c "2018-$honap" $1` > 0; then
                        ferfi=`grep "$2018-$honap" $1 | grep -c -e ",Male,"`
                        ferfiossz=$(( $ferfiossz + $ferfi ))
			no=`grep "2018-$honap" $1 | grep -c -e ",Female,"`
			noossz=$(( $noossz + $no ))
                fi
        done
echo "$noossz"
echo "$ferfiossz"

echo $(( $ferfiossz / 7 ))

if [ $ferfiossz -gt $noossz ]
 then
                       echo "ferfi"
                else
                        echo "no"
                fi


