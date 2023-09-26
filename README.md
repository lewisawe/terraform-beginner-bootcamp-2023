# Terraform Beginner Bootcamp 2023

## Semantic Versioning :mage:

This project is going utilize semantic versioning for its tagging. [semver.org](https://semver.org/)

The general format:

**MAJOR.MINOR.PATCH**, eg. `1.0.1`

-**MAJOR** version when you make incompatible API changes
-**MINOR** version when you add functionality in a backward compatible manner
-**PATCH** version when you make backward compatible bug fixes

## Terraform installation 

### Considerations with the Terraform CLI Changes
Use link  to get the latest instructions to install Terraform due to change of GPG Keyring. 

[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Considerations for Linux Distribution

This project is built against Ubuntu, consider checking your linux distribution and change installation and instructions accordingly 
[How to check Linux OS version](https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/ )

An example of an OS Version:

```
$ cat /etc/os-release

PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy

```

### refractoring into bash Scripts

Due to the changes in the terraform installation, we created a new Bash script to handle installation

The new bash script is located [./bin/install_terraform_cli](./bin/install_terraform_cli)

- Will also keep the gitpod Task File Tidy ([.gitpod.yml](.gitpod.yml))

#### Shebang

A Shebang tells the operating system which interpreter to use when running the script, and is the first line of the script eg `#!/bin/bash`

Recommended to use `#!/usr/bin/env bash` for easier portability and will also search Users Path for bash execution

When executing bash script we can user `./` short hand notation to execute the bash script

eg. `./bin/install_terraform_cli`

If we are using a script in .gitpod.yml  we need to point the script to a program to interpert it.

eg. `source ./bin/install_terraform_cli`

https://en.wikipedia.org/wiki/Shebang_(Unix)

#### Linux Permissions Considerations

For the bas script to be executable you need to change permissions 

```sh 
chmod u+x ./bin/install_terraform_cli
```

Or use 

```sh 
chmod 744 ./bin/install_terraform_cli
```

https://en.wikipedia.org/wiki/Chmod 


### GitPod Lifecycle (Before, init, Command)

Best practice when using Init because it will not rerun

https://www.gitpod.io/docs/configure/workspaces/tasks 

### Working Env Vars

#### env command

We can list out all Enviroment Variables (Env Vars) using the `env` command

We can filter specific env vars using grep eg. `env | grep AWS_`

#### Setting and Unsetting Env Vars

In the terminal we can set using `export HELLO='world`

In the terrminal we unset using `unset HELLO`

We can set an env var temporarily when just running a command

```sh
HELLO='world' ./bin/print_message
```
Within a bash script we can set env without writing export eg.

```sh
#!/usr/bin/env bash

HELLO='world'

echo $HELLO
```

#### Printing Vars

We can print an env var using echo eg. `echo $HELLO`

#### Scoping of Env Vars

When you open up new bash terminals in VSCode it will not be aware of env vars that you have set in another window.

If you want to Env Vars to persist across all future bash terminals that are open you need to set env vars in your bash profile. eg. `.bash_profile`

#### Persisting Env Vars in Gitpod

We can persist env vars into gitpod by storing them in Gitpod Secrets Storage.

```
gp env HELLO='world'
```

All future workspaces launched will set the env vars for all bash terminals opened in thoes workspaces.

You can also set en vars in the `.gitpod.yml` but this can only contain non-senstive env vars.

### AWS CLI Installation

AWS CLI is installed for the project via the bash script [`./bin/install_aws_cli`](./bin/install_aws_cli)


[Getting Started Install (AWS CLI)](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
[AWS CLI Env Vars](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

We can check if our AWS credentials is configured correctly by running the following AWS CLI command:
```sh
aws sts get-caller-identity
```

If it is succesful you should see a json payload return that looks like this:

```json
{
    "UserId": "AIEAVUO15ZPVHJ5WIJ5KR",
    "Account": "123456789012",
    "Arn": "arn:aws:iam::123456789012:user/terraform-beginner-bootcamp"
}
```

We'll need to generate AWS CLI credits from IAM User in order to the user AWS CLI.



