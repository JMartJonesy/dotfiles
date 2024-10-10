1. Download minimal [NixOS ISO](https://nixos.org/download/)
2. Flash ISO to usb drive using [Rufus](https://rufus.ie/)
3. Disable secure boot on new PC
4. Boot into usb on new PC
5. Setup internet connection
  a. Plug in ethernet cable
  b. Setup wifi
    i. Start wpa_supplicant `sudo systemctl start wpa_supplicant`
   ii. Run `wpa_cli`
  iii.  ```
        add_network
        set_network 0 ssid "<YOUR WIFI SSID>"
        set_network 0 psk "<YOUR WIFI PASSWORD>"
        set_network 0 key_mgmt WPA-PSK
        enable_network 0
        quit
        ```
6. `cd /tmp`
7. Download disko nix config `curl https://raw.githubusercontent.com/JMartJonesy/dotfiles/refs/heads/main/drives.nix -o /tmp/drives.nix`
8. (Optional) `lsblk` to get drive name and update drives.nix `devices = /dev/<YOUR DRIVE NAME HERE`
9. Run disko to setup drive `sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /tmp/disk-config.nix`
10. Enter your encryption key when prompted
11. Confirm everything was mounted as expected `mount | grep /mnt`
12. Generate your nix configuration files excluding the filesystem portion as we will use drives.nix for that `sudo nixos-generate-config --no-filesystems --root /mnt`
13. Move drives.nix to /mnt/etc/nixos `sudo mv /tmp/disk-config.nix /mnt/etc/nixos`
14. `cd /mnt/etc/nixos`
15. Update configuration.nix imports to include disko and drives.nix ```
        imports =
         [ # Include the results of the hardware scan.
           ./hardware-configuration.nix
           "${builtins.fetchTarball "https://github.com/nix-community/disko/archive/master.tar.gz"}/module.nix"
           ./disk-config.nix
         ];
        ```
16. Install nixos on your drive `sudo nixos-install`
17. Enter root password when prompted
18. If everything succeeds `reboot`
