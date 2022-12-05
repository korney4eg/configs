# This file stores functions
function space
{
	if [ "x$1" == "x" ]; then
		put="."
	else
		put=$1
	fi
	if [ -d "$put" ]; then
		put=$put/*
	fi
	du "$put" -s | sort -g| awk '{print $1/1024 " MB","\t"$2}'
}

function cover () {
    local t=$(mktemp -t cover)
    go test "$COVERFLAGS" -coverprofile="$t" "$@" \
        && go tool cover -func="$t" \
        && unlink "$t"
}

function kgp () {
k get pod  "$1" -o json|jless
}
