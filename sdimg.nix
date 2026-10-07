{pkgs, ...}: {
  sdImage = {
    compressImage = false;
    imageName = "nixos-cm4-debug.img";

    postBuildCommands = ''
      echo "Generating bmap metadata files..."
      ${pkgs.bmaptool}/bin/bmaptool create "$img" > "$out/sd-image/nixos-cm4-debug.bmap"
    '';
  };
}
