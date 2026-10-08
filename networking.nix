{...}: {
  networking = {
    useDHCP = false;

    interfaces.eth0 = {
      useDHCP = false;
      ipv4.addresses = [
        {
          address = "192.168.0.101";
          prefixLength = 24; # Equivalent to subnet mask 255.255.255.0
        }
      ];
    };

    # router IP address
    defaultGateway = "192.168.1.1";

    # DNS nameservers
    nameservers = ["1.1.1.1" "8.8.8.8"];
  };
}
