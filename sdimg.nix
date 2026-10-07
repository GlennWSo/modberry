{
  pkgs,
  config,
  ...
}: {
  sdImage = {
    compressImage = true;

    # postBuildCommands = ''
    #   echo "Generating bmap file..."
    #   ${pkgs.bmaptool}/bin/bmaptool create -o "$out/sd-image/${config.sdImage.imageName}.bmap" "$img"
    # '';
  };
}
