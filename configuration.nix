{pkgs, ...}: {
  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "yes";
  };
  system.stateVersion = "26.11";
  environment.systemPackages = with pkgs; [
    helix
  ];
}
