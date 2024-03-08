{
  config,
  pkgs,
  ...
}: {
  services = {
    ollama.enable = true;
    ollama.acceleration = "rocm";
  };
}
