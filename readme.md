Overview

PHP Version Manager for Unix (PVM)
Your PHP Version Manager is a command-line tool designed to simplify the management of PHP versions on your system. It allows you to switch between different PHP versions effortlessly.

Features
Easy Version Switching: Quickly switch between installed PHP versions.
Listing Available Versions: View a list of PHP versions installed on your system.

1 - Installation

Clone the repository:
https://github.com/HermesSantos/pvm-linux

Move the code to /usr/bin/pvm

Make it executable
sudo chmod +x /usr/local/bin/pvm

Verify if PVM is working properly
pvm --version or pvm -v

2 - Usage

Listing Installed PHP Versions
pvm list

Switching PHP Version
pvm use [version]

Show help
pvm -h or pvm --help

Contribution
Contributions are welcome! Feel free to open issues, submit pull requests, or suggest new features.

License
This PHP Version Manager is open-source software licensed under the MIT License.
