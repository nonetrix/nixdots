{
  config,
  pkgs,
  ...
}: {
  services = {
    # Docker like LLM deamon
    ollama.enable = true;
    ollama.acceleration = "rocm"; # Tells it to compile with ROCm (Radeon Open Compute platform)
  };
}
