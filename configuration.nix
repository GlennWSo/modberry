{pkgs, ...}: {
  services.openssh = {
    enable = true;
  };
  system.stateVersion = "26.11";
}
