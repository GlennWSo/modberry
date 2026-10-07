{pkgs, ...}: {
  boot = {
    initrd.allowMissingModules = true;
    loader = {
      generic-extlinux-compatible.enable = true;

      grub.enable = false;
    };
  };
  hardware = {
    i2c.enable = true;

    raspberry-pi = {
      firmware = {
        enable = true;
        uboot.enable = true;
      };

      # 3. Modern config.txt structure explicitly targeted at the CM4
      configtxt.settings = {
        # Settings applied universally across all boot conditions
        all = {
          dtparam = ["i2c_arm=on"];
          dtoverlay = [
            "dwc2,dr_mode=host"
            "pi3-miniuart-bt"
          ];
        };

        # CM4 specific overrides can live here if needed down the road
        cm4 = {
          # Example: Force OTG mode if your specific carrier board requires it
          # otg_mode = 1;
        };
      };
    };
  };
}
