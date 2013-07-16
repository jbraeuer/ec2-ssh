#compdef ec2-ssh

_ec2_ssh() {
    local state IFS
    typeset -A opt_args

    _arguments -s -S \
	"-k+[KEY]" \
	"-s+[SECRET]" \
	"-t+[TAG]" \
	"-r+[REGION]" \
	"*: :->hosts"

    case $state in
	hosts)
	    IFS=$'\n'
	    hosts=( $(ec2-host --separator ';' | cut -f1 -d';') )
	    compadd "$@" "${hosts[@]}"
	    ;;
	*)
	    # nothing for now
	    ;;
    esac
}

_ec2_ssh "$@"
