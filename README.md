# Welcome to rmBug

rmBug is a software project management tool 

## What next?

rmBug started off a GitlabHQ fork, in attempt to establish a community-lead
project with FOSS best practices, as well as to innovate in the software project
management space.

Since we are still young, resources that are on your disposal are limited, but
we are improving them every day, so we hope that you will join us soon.

## I want to contribute to rmBug, what do I do?

We tried to make the process of contributing as painless as possible, while preserving
the quality of contributions and project health. Documentation that you might want to
read before contributing can be found [here](https://github.com/mario/rmbug/tree/master/doc).

## How do I install rmBug for production on Ubuntu 11.10 or Debian 6?

Before running the magical command, you might want to install curl and nano by issuing the following
command:

	sudo apt-get install -y curl nano

After that, run the following, while replacing domain.com with the domain/subdomain where you
intend to host rmBug, mysql_root with desired mysql root password, and rmbug_pass with the
desired password for rmug mysql user.

	bash -c "`curl https://raw.github.com/mario/rmbug/master/doc/install/stage1_ubuntu1110.sh`" domain.com mysql_root rmbug_pass
	
Installation on Debian 6 is very similar - you just need to issue the following command:

  bash -c "`curl https://raw.github.com/mario/rmbug/master/doc/install/stage1_debian6.sh`" domain.com mysql_root rmbug_pass

## IRC

We can be found idling on #rmbug in irc.freenode.net
