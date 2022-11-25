#!/bin/bash
if [ $# == 2 ]  ; then
if [[ $1 == "block" ]] || [[ $1 == "unblock" ]] ; then 
if [[ -f $2 ]] ; then 	
if [[ $1 == "block" ]];then 
	input="$2"
	while read -r check ; do
	iptables -t filter --check INPUT -s $check -j ACCECPT
	if [[ $? == 0 ]]; then
		iptables -t filter --delete INPUT -s $check -j ACCEPT
	fi
	iptables -t filter -A INPUT -s $check -j DROP
done < "$input"
	fi
if [[ $1 == "unblock" ]];then 
	input="$2"
	while read -r check ; do 
	iptables -t filter --check INPUT -s $check -j DROP
	if [[ $? == 0 ]]; then
		iptables -t filter --delete INPUT -s $check -j DROP
	fi
	iptables -t filter -A INPUT -s $check -j ACCEPT
done < "$input"	
fi
else 
	echo "ip list file not found"
fi
else
	echo "invalid command"
fi
else 
	echo "not enough arguments"
fi
