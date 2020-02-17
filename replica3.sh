
#!/bin/sh
echo "Configuring GHES replica"
echo y | ghe-repl-setup "$1" --force --verbose 2>&1
