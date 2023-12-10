# TODO: Replace with systemd timer

#{ config, pkgs, ... }:
#{
#  # Host file configuration
#  networking.extraHosts = let
#    # List of hosts file URLs
#    hostsList = [
#      "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/gambling/hosts"
#      "https://www.github.developerdan.com/hosts/lists/dating-services-extended.txt"
#      "https://www.github.developerdan.com/hosts/lists/amp-hosts-extended.txt"
#      "https://blocklistproject.github.io/Lists/facebook.txt"
#      "https://blocklistproject.github.io/Lists/tiktok.txt"
#      "https://blocklistproject.github.io/Lists/abuse.txt"
#      "https://blocklistproject.github.io/Lists/fraud.txt"
#      "https://blocklistproject.github.io/Lists/phishing.txt"
#      "https://blocklistproject.github.io/Lists/redirect.txt"
#      "https://blocklistproject.github.io/Lists/scam.txt"
#      "https://blocklistproject.github.io/Lists/ransomware.txt"
#    ];
#    # Iterate through the list of URLs
#    hosts = builtins.map (url: let
#      # Download the hosts file from each URL
#      hostsFile = builtins.fetchurl url;
#    in builtins.readFile "${hostsFile}") hostsList;
#  in builtins.concatStringsSep "\n" hosts;
#}
