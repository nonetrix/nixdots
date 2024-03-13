{options, ...}: {
  # Makes sure time is in sync by contacting time server
  networking.timeServers = options.networking.timeServers.default ++ ["0.us.pool.ntp.org" "1.us.pool.ntp.org" "2.us.pool.ntp.org" "3.us.pool.ntp.org"];
  services.ntp.enable = true; # Network Time Protocol
}
