{ config, pkgs, ... }:

{
  environment = {
    # for cachy
    # systemPackages = [ pkgs.lan-mouse_git ];
    variables.RUST_MIN_STACK = "16777216";

    # Optionally set system-wide environment variables
    sessionVariables = {
      NIXOS_OZONE_WL = "1";

      # for steam protonup to generate in the right dir
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = 
        "/home/teodor/.steam/root/compatibilitytools.d";
    };
  };
}
