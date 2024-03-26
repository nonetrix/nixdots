{pkgs, ...}: {
  boot.initrd.kernelModules = ["amdgpu"];
  services.xserver.enable = true;
  services.xserver.videoDrivers = ["amdgpu"];

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true; # Let's 32Bit GPU accelrated aplications run

    # System-wide packages for ROCm (Radeon Open Compute), e.g. AI, etc
    extraPackages = with pkgs; [
      rocmPackages.clr.icd
      rocm-opencl-icd
      rocm-opencl-runtime
    ];
  };

  # Makes sure ROCm can be found by aplications
  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];

  # Packages for ROCm e.g. AI, etc.
  environment.systemPackages = [
    pkgs.rocmPackages.rocm-smi # Gives GPU info e.g. RX 6800, 16GBs VRAM, core usage 12%, 2043MB VRAM used. Clone of nvidia-smi, not much to do with compute actually
    pkgs.rocmPackages.rocminfo
  ];
}
