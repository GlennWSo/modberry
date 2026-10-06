{...}: {
  boot.initrd.availableKernelModules = ["dwc2"];
  boot.kernelModules = ["dwc2"];

  boot.loader.raspberryPi = {
    enable = true;
    firmwareConfig = ''
      dtoverlay=dwc2,dr_mode=host
      dtoverlay=pi3-miniuart-bt
      dtparam=i2c_arm=on
    '';
  };
  services.openssh.enable = true;

  hardware.deviceTree = {
    enable = true;
    filter = "*bcm2711-rpi-cm4.dtb";
  };
}
