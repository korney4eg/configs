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

function aws_encrypt
{
  ENVIRONMENT=$1
  KEYWORD=$2
  aws-okta exec "okta-${ENVIRONMENT}" -- aws kms encrypt --key-id alias/applications --plaintext "${KEYWORD}" --output text --query CiphertextBlob
}

function aws_terraform
{
  LANDSCAPE=$2
  ACTION=$1
  if [[  "$LANDSCAPE" == "dev"  ]] || [[  "$LANDSCAPE" == "nonprod"  ]] || [[ "$LANDSCAPE" == "prod" ]]
  then
    ENVIRONMENT="${LANDSCAPE}"
  else
    ENVIRONMENT="dev"
  fi
  VERSION="${VERSION}" ENV="${ENVIRONMENT}" LANDSCAPE="${LANDSCAPE}" aws-okta exec "okta-${ENVIRONMENT}" -- make "${ACTION}"
}
