#/bin/sh
nix-collect-garbage  --delete-old
sudo nix-collect-garbage  --delete-old
sudo /run/current-system/bin/switch-to-configuration boot
