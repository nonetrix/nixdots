{pkgs, ...}: let
  sha256-from-url = pkgs.writeShellScriptBin "sha256-from-url" ''
    if [ $# -ne 1 ]; then
      echo "Usage: $0 <URL>"
      exit 1
    fi

    curl -sL $1 | sha256sum
  '';
in {
  environment.systemPackages = [sha256-from-url];
}
