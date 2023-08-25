{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "amdgpu" ];
  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true;
  boot.extraModulePackages = [ ];

  hardware.opengl.extraPackages = with pkgs; [
    rocm-opencl-icd
    rocm-opencl-runtime
  ];

  fileSystems."/" =
    { device = "/dev/nvme0n1p2";
      fsType = "ext4";
    };

  fileSystems."/boot/efi" =
    { device = "/dev/nvme0n1p1";
      fsType = "vfat";
    };

  fileSystems."/mnt/hdd" =
    { device = "/dev/sda1";
      fsType = "ext4";
    };


  swapDevices = [ ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
