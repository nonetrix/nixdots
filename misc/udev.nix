{
  config,
  pkgs,
  ...
}: {
  services.udev.extraRules = ''
    KERNEL=="i2c-[0-99]*", TAG+="uaccess"
    KERNEL=="port", TAG+="uaccess"
    SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="2516", ATTRS{idProduct}=="0051", TAG+="uaccess", TAG+="AMD_Wraith_Prism"
    SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="1532", ATTRS{idProduct}=="0209", TAG+="uaccess", TAG+="Razer_Blackwidow_Chroma_Tournament_Edition"
    SUBSYSTEMS=="usb|hidraw", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c092", TAG+="uaccess", TAG+="Logitech_G203_Lightsync"
  '';
}
