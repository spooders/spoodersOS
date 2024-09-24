{ config, pkgsStable, pkgsUnstable, ... }:

{
  systemd.user.services = {
    mpris-proxy = {
      enable = true;
      description = "Mpris proxy";
      after = [ "network.target" "sound.target" ];
      wantedBy = [ "default.target" ];

      # Use stable bluez package
      serviceConfig.ExecStart = "${pkgsStable.bluez}/bin/mpris-proxy";
    };
  };
}
