zstdcat someOsImageFile.img.zst | sudo dd of=/dev/sda bs=4M status=progress oflag=sync
