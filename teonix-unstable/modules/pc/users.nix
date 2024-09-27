{ config, pkgs, stable-pkgs, ... }:

{
  users = {
    users.teodor = {
      isNormalUser = true;
      description = "teodor";
      extraGroups = [ "networkmanager" "wheel" "docker" "libvirt" "nordvpn" ];

      # Choose packages from either stable or unstable
      packages = with pkgs; [
        # Add unstable packages here (e.g., wget from unstable if needed)
      ] ++ (with stable-pkgs; [
        # Use stable packages if needed
      ]);
    };
  };
}
