[![Build Status](https://secure.travis-ci.org/intuit/aws_cli-cookbook.png)](http://travis-ci.org/intuit/aws_cli-cookbook)

# aws_cli-cookbook cookbook
Installs AWS command line tools via [AWS CLI Omnibus package](https://github.com/intuit/omnibus-aws_cli)

# Requirements
* Chef 10.x

Platform:
* CentOS 6.x
* RHEL 6.x

# Usage
Add the aws_cli cookbook to your role/run_list.

# Attributes
## default
node['aws_cli']['name']    - Name of the aws_cli package.
node['aws_cli']['version'] - Version of aws_cli to install.

# Recipes
## default
Installs AWS CLI rpm.

# Author
* Capen Brinkley (@capen)
