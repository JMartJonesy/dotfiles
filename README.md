TODO FOR FRAMEWORK 16:
- [x] Use [nixos-hardware](https://github.com/NixOS/nixos-hardware/tree/master/framework/16-inch/7040-amd)
- [ ] Confirm framework [VIA tool](https://keyboard.frame.work/) works **Doesn't work with firefox :'(**
- [ ] Setup fingerprint (sudo fprintd-enroll $USER <- figure out how to impermanence this), bluetooth, wifi, camera (try Guvcview), mic
- [x] Investigate [power management tool](https://gitlab.freedesktop.org/upower/power-profiles-daemon) NOTE: This is added by nixos-hardware import
- [ ] Investigate [framework-tool](https://github.com/FrameworkComputer/framework-system) NOTE: This is added by nixos-hardware import
- [x] Add [Fwupd](https://wiki.nixos.org/wiki/Fwupd)
- [ ] Investigate setting up inputmodule-control program to configure rgb panels next to keyboard
- [ ] Get rid of .config and .cache by moving everything into nixos configs
- [ ] Investigate [abm](https://community.frame.work/t/adaptive-backlight-management-abm/41055)
- [ ] Add [reFIND](https://nixos.wiki/wiki/REFInd) **Currently not possible with lanzaboote**
- [x] Add [secure boot](https://github.com/nix-community/lanzaboote/blob/master/docs/QUICK_START.md)
- [ ] Add [impermanence](https://nixos.wiki/wiki/Impermanence)
- [x] Add [disk encryption](https://nixos.wiki/wiki/Full_Disk_Encryption)
- [x] Add [Disko](https://nixos.wiki/wiki/Disko)
- [ ] Add [secrets](https://github.com/Mic92/sops-nix)
- [ ] Dual-boot with Windows

NOTES:
- Use Btrfs as filesystem
- Enable vrr and see how power consumption changes
