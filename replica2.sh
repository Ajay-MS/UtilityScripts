#!/bin/sh
echo "Configuring GHES replica"
echo y | ghe-repl-setup "$1" --force --verbose
echo "GHES replica setup command executed"
ghe-repl-start
