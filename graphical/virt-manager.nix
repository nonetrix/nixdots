{
  config,
  pkgs,
  ...
}: {
  # Enable deamon needed for virt-manager think VirtualBox
  virtualisation.libvirtd.enable = true;
  #TODO: Honestly not sure why this is here instead of somewhere else, is it even needed?
  programs.dconf.enable = true;
  environment.systemPackages = with pkgs; [virt-manager];
}
