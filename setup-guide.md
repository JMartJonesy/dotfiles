1. Download minimal [NixOS ISO](https://nixos.org/download/)
2. Flash ISO to usb drive using [Rufus](https://rufus.ie/)
3. Disable secure boot on new PC
4. Boot into usb on new PC
5. Setup internet connection
	1. Plug in ethernet cable
	2. Setup wifi
		1. Start wpa_supplicant 
		```bash
			sudo systemctl start wpa_supplicant
		```
		2. Start cli 
		```bash
		   wpa_cli
		```
		3. Setup your network and connect
		```
		   add_network        
		   set_network 0 ssid "<WIFI SSID>"        
		   set_network 0 psk "<WIFI PASSWORD>"        
		   set_network 0 key_mgmt WPA-PSK        
		   enable_network 0        
		   quit
		```  
6.  Move to /tmp folder and setup disko config
```bash 
cd /tmp
```
7. Download disko nix config 
```bash
curl https://raw.githubusercontent.com/JMartJonesy/dotfiles/refs/heads/main/drives.nix -o /tmp/drives.nix
```
8. (Optional) Find drive name and update drives.nix 
```bash
lsblk
```
```nix
devices = /dev/<YOUR DRIVE NAME HERE
```
9. Run disko to setup drive 
```bash
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /tmp/disk-config.nix
```
10. Enter your encryption key when prompted (Write this down somewhere)
11. Confirm everything was mounted as expected 
```bash
mount | grep /mnt
```
12. Generate your nix configuration files excluding the filesystem portion as we will use drives.nix for that 
```bash
sudo nixos-generate-config --no-filesystems --root /mnt
```
13. Move drives.nix to /mnt/etc/nixos and move to /mnt/etc/nixos
```bash
sudo mv /tmp/disk-config.nix /mnt/etc/nixos
cd /mnt/etc/nixos
```
14. Update configuration.nix imports to include disko and drives.nix 
```nix
imports = [ # Include the results of the hardware scan.
   ./hardware-configuration.nix
   "${builtins.fetchTarball "https://github.com/nix-community/disko/archive/master.tar.gz"}/module.nix"
   ./disk-config.nix
];
```
15. Enable networkmanager int your configuration.nix otherwise you will have no wifi on reboot
```nix
networking.networkmanager.enable = true;
```
16. Add user to configuration.nix there should already be a block you can update with the following 
```nix
users.users.jmartjonesy = {
	isNormalUser = true;
	extraGroups = [ "networkmanager" "wheel" ];
};
```
17. Install nixos on your drive 
```bash
sudo nixos-install
```
18. Enter root password when prompted
19. Set password for the user you created in step 16 
```bash
sudo nixos-enter --root /mnt -c 'passwd jmartjonesy'
```
20. Reboot and login as your user
```bash
reboot
```
21. Setup wifi but this time with nmcli  
```bash
nmcli radio wifi on
nmcli dev wifi connect network-ssid password "network-password"
```
22. Confirm systemd-boot is the currently bootloader as this is required to steup lanzaboote for Secure Boot
```bash 
bootctl status
```
23. Create Secure Boot keys
```bash
sudo sbctl create-keys
```
24. Add pgks.git to your configuration.nix
25. Clone dotfiles repo locally
```bash
cd
git clone https://github.com/JMartJonesy/dotfiles.git
```
26. Replace `/etc/nixos` with `~/dotfiles/nixos`
```bash
cd /etc/nixos
sudo mkdir backup
sudo mv ./* backup
sudo cp -r ~/dotfiles/nixos/* .
```
27. Checkout kickstart.nxivim in the home-manager directory and switch to jmartjonesy branch
```bash
cd hosts/shared/home-manager
git clone https://github.com/JMartJonesy/kickstart.nixvim.git
git checkout -b jmartjonesy
```
28. Rebuild nixos configuration with your host (see available hosts in flake.nix)
```bash
sudo nix --experimental-features "nix-command flakes" run nixos-rebuild switch --flake /etc/nixos#<HOST_NAME>
```
29. Check that your machine is ready for Secure Boot (It is expected that `/boot/EFI/nixos/kernel*.efi` files are not signed, everything else should be signed)
```bash
sudo sbctl verify
```
30. Reboot into BIOS
31. Enable Secure boot (Framework laptops require a slightly different setup see [here](https://github.com/nix-community/lanzaboote/blob/master/docs/QUICK_START.md#part-2-enabling-secure-boot) for details)
32. Enroll your keys
```bash
sudo sbctl enroll-keys --microsoft
```
33. Reboot and confirm nixos boots. You will need to enter your encryption key set in step 10 every time you boot to unlock your drive
34. (Optional) Register your fingerprint (Need to have `fprintd` installed)
```bash
sudo fprintd-enroll $USER
```

REFERENCES:
- https://github.com/nix-community/disko/blob/master/docs/quickstart.md
- https://haseebmajid.dev/posts/2024-07-30-how-i-setup-btrfs-and-luks-on-nixos-using-disko/?utm_source=perplexity
- https://github.com/nix-community/lanzaboote/blob/master/docs/QUICK_START.md
