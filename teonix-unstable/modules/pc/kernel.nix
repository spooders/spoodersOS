{ config, pkgs, pkgsStable, ... }:

{
  boot = {
    # Choose the kernel from either stable or unstable as needed
    kernelPackages = pkgs.linuxPackages_cachyos;

    #chaotic.scx.enable = true; # by default uses scx_rustland scheduler

    #kernelPackages = pkgsStable.linuxPackages_zen;
    

    #kernelPackages = pkgs.linuxPackages_xanmod_latest;

    # This is for OBS Virtual Cam Support
    kernelModules = [ "v4l2loopback" ];
    extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ];
    # Needed For Some Steam Games
    kernel.sysctl = {
      "vm.max_map_count" = 2147483642;
    };


    kernelParams = [
      "hid_apple.fnmode=0"
      "drm_kms_helper.edid_firmware=edid/edid.bin"
      "video=DP-1:e"
      "ipv6.disable=1"
    ];
  };
}
