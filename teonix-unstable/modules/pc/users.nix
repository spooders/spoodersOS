{ config, pkgsStable, pkgsUnstable, ... }:

{
  users = {
    users.teodor = {
      isNormalUser = true;
      description = "teodor";
      extraGroups = [ "networkmanager" "wheel" "docker" "libvirt" "nordvpn" ];

      # Choose packages from either stable or unstable
      packages = with pkgsUnstable; [
        # Add unstable packages here (e.g., wget from unstable if needed)
      ] ++ (with pkgsStable; [
        # Use stable packages if needed
      ]);
    };
  };
}
