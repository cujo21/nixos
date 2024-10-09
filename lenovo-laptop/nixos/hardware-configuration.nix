{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/96bd387c-ae00-493f-a7c2-15ca51ddd262";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/A5F0-7B5C";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };
  fileSystems."/home/cujo/mount" =
    { device = "/dev/disk/by-uuid/d2b8163c-6d88-47a1-8cd3-b8b9733480fc";
      fsType = "ext4";
      options = [ "defaults" "user=cujo" ];
    };

  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
