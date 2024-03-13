{...}: {
  # TODO: I feel like USB Automount isn't a good idea, maybe I should remove this? Security part of them doesn't like
  services = {
    gvfs.enable = true;
    udisks2.enable = true;
    devmon.enable = true;
  };
}
