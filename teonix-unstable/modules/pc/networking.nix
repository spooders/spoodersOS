{ config, ... }:

{
  networking = {
    hostName = "nixbox";

    networkmanager = {
      enable = true;
    };

    #routes = [
    #  {
    #    address = "192.168.1.0/24";  # Replace with your network
    ##    via = "192.168.1.1";         # Replace with your gateway if needed
    #    interface = "enp3s0";        # The interface for the route
    #  }
    #];

    firewall = {
      allowedTCPPorts = [ 443 ];
      allowedUDPPorts = [ 1194 ];

      #allowedUDPPortRanges = [
      #  { from = 32768; to = 61000; }
      #];

      checkReversePath = false; # for nordvpn compatibility
    };

    wireguard.enable = true;

  };

  # nordvpn?
  chaotic.nordvpn.enable = true;
}
