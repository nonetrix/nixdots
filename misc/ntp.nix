{ pkgs, lib, options, ...}:
{
  networking.timeServers = options.networking.timeServers.default ++ [ "0.us.pool.ntp.org" "1.us.pool.ntp.org" "2.us.pool.ntp.org" "3.us.pool.ntp.org" ]; 
  services.ntp.enable = true;
}