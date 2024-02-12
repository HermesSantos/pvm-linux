#TODO add it on path
#!/bin/bash

flag="$1"
secong_flag="$2"

arguments="list, -l, use [PHP_Version], --help, -h"
directory="/usr/bin"
update_alternatives="sudo update-alternatives --set php /usr/bin/php$secong_flag"
actual_verison="PVM - PHP Version Manager\n 1.0.0"
warn_no_args="No arguments given. Type pvm --help or pvm -h to see all the commands"
install_php_version="sudo apt-get install php$secong_flag"

install_ppa_for_php="sudo add-apt-repository ppa:ondrej/php"
verify_ppa() {
	ls /etc/apt/sources.list.d/ | grep ondrej
}

list_php_versions() {
	ls $directory | grep -oP 'php\d+\.\d+' | sed 's/php//' | while read -r version; do
		if php -v | grep -oP 'PHP \K[0-9]+\.[0-9]+\.[0-9]+' | grep -q "$version"; then
			echo $version "* (Current using)"
		else
			echo $version
		fi
	done
}
get_current_php_version() {
	php -v | grep -oP 'PHP \K[0-9]+\.[0-9]+\.[0-9]+'
}
install_ppa_for_php() {
	sudo add-apt-repository ppa:ondrej/php
}

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
		if [ "$secong_flag" = "" ]; then
			echo "$warn_no_args"
		else
			$update_alternatives
		fi
	elif [ "$flag" = "-i" ]; then
		ppa_files=$(verify_ppa)
		if [ "$secong_flag" = "" ]; then
			echo "$warn_no_args"
		elif [ -n "$ppa_files" ]; then
			install_php_version
		else
			echo "Installing PPA"
			install_ppa_for_php
		fi
	fi
}

verify_flags
