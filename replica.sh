#!/bin/sh
echo "Configuring GHES replica on $1"
ghe-repl-setup $1 -f
echo "GHES replica setup command executed"
ghe-repl-start
