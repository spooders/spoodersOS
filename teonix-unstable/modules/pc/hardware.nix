{ config, pkgs, inputs, ... }:

let
  pkgs-unstable = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in

{
  imports = [
    ./hardware-configuration.nix  # The generated hardware config
  ];

  hardware = {
    # Load custom EDID
    # REQUIRES mkdir -p /etc/custom-files/edid/ && sudo cp edid.bin /etc/custom-files/edid/
    firmware = [
      (
        pkgs.runCommand "edid.bin" { } ''
          mkdir -p $out/lib/firmware/edid
          cp ${/etc/custom-files/edid/edid.bin} $out/lib/firmware/edid/edid.bin
        ''
      )
    ];

    # Miscellaneous configurations

    # Enable sound with Pipewire
    pulseaudio.enable = false;
    bluetooth.enable = true;

    # Bluetooth settings
    bluetooth.settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
        Experimental = true;
      };
    };

    # Graphics settings
    graphics = {
      enable = true;

      #package32 = pkgs-unstable.pkgsi686Linux.mesa.drivers;

      ## amdvlk: an open-source Vulkan driver from AMD
      #extraPackages = [ pkgs.amdvlk ];
      #extraPackages32 = [ pkgs.driversi686Linux.amdvlk ];

    };

  };

  
}
