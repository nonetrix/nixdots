{
  config,
  pkgs,
  ...
}: {
  # TODO: Figure out how to add pro drivers as well
  boot.initrd.kernelModules = ["amdgpu"];
  services.xserver.videoDrivers = ["amdgpu"];

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;

    extraPackages = with pkgs; [
      rocmPackages.clr.icd
      rocm-opencl-icd
      rocm-opencl-runtime
    ];
  };

  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];

  environment.systemPackages = [
    pkgs.rocmPackages.rocm-smi
    pkgs.rocmPackages.rocminfo
  ];
}
