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





