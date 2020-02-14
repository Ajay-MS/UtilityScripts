#!/bin/sh
echo "Configuring GHES replica on $1"
echo y | ghe-repl-setup $1 --force --verbose
echo "GHES replica setup command executed"
ghe-repl-start
