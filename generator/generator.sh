#!/bin/bash
i=`ls in | wc -w`
mkdir out 
while [ $i -gt 0 ] ; do 
	cat "in/input$i.txt" | python3 main.py > out/output$i.txt
	 i=$(($i-1))
done
