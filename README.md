# nixdots
```
 ________         __                                 __         
|  |  |  |.-----.|  |.----.-----.--------.-----.    |  |_.-----.
|  |  |  ||  -__||  ||  __|  _  |        |  -__|    |   _|  _  |
|________||_____||__||____|_____|__|__|__|_____|    |____|_____|
                                                                
                         ___ __ __                              
.--------.--.--.       .'  _|__|  |.-----.-----.                
|        |  |  |     __|   _|  |  ||  -__|__ --|                
|__|__|__|___  |    |__|__| |__|__||_____|_____|                
         |_____|                                                 
```

## TODO:
- Look into if statements for things like enabling NVIDIA GPU monitor on the status bar, propritery software etc.
- Move to flakes
- Write config for server and phone via termux fork and flakes
- Organize code
- Generally clean code 
- Check that comment style is consistent e.g. same wording
- Add Ranger or Joshuto config

## Installation

# Please note that unless you have a NVIDIA GPU, 165Hz monitor, same username and the same disk name as well you might need to do some hacking

1. Install NixOS unstable with GUI installer and no desktop
2. Boot into installed OS
3. Connect to WiFi if needed with nmtui
4. Run nix-shell -p git
5. Run git clone https://github.com/nonetrix/nixdots
6. Run sudo nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
7. Run sudo nix-channel --update
8. Run sudo cp -r ./nixdots/* /etc/nixos
9. Run sudo nixos-rebuild switch
10. Reboot and hope for best
