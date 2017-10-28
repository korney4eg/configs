# This file stores functions
function space
{
	if [ "x$1" == "x" ]; then 
		put="."
	else
		put=$1
	fi
	if [ -d $put ]; then 
		put=$put/*
	fi
	du $put -s | sort -g| awk '{print $1/1024 " MB","\t"$2}'
}
