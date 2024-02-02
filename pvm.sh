#TODO add it on path
#!/bin/bash

flag="$1"
php_version="$2"

arguments="list, -l, use [PHP_Version], --help, -h"
directory="/usr/bin"
update_alternatives="sudo update-alternatives --set php /usr/bin/php$php_version"
actual_verison="PVM - PHP Version Manager\n 1.0.0"

list_php_versions() {
	ls $directory | grep -oP 'php\d+\.\d+' | sed 's/php//'
}
warn_no_args="No arguments given. Type pvm --help or pvm -h to see all the commands"

verify_flags() {
	if [ "$flag" = "" ]; then
		echo $warn_no_args
	elif [ "$flag" = "-h" ]; then
		echo "$arguments"
	elif [ "$flag" = "-v" ]; then
		echo "$actual_verison"
	elif [ "$flag" = "--version" ]; then
		echo "$actual_verison"
	elif [ "$flag" = "--help" ]; then
		echo "$arguments"
	elif [ "$flag" = "list" ]; then
		echo "PHP Versions"
		list_php_versions
	elif [ "$flag" = "use" ]; then
		if [ "$php_version" = "" ]; then
			echo "$warn_no_args"
		else
			$update_alternatives
		fi
	fi
}

verify_flags
