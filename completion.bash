_ec2_ssh() {
    local cur opts IFS
    declare -a hosts

    COMPREPLY=()
    cur="${COMP_WORDS[$COMP_CWORD]}"

    opts="-k -s -r -t"
    if [ "${cur}" == "-" ]; then
	COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
	return 0
    fi

    IFS=$'\n'
    if [ "$cur" != "" ]; then
	hosts=( $(ec2-host --separator ';' | cut -f1 -d';' | grep $cur) )
    else
	hosts=( $(ec2-host --separator ';' | cut -f1 -d';') )
    fi
    COMPREPLY=( $(printf '%q\n' "${hosts[@]}") )
    return 0
}

complete -F _ec2_ssh ec2-ssh
