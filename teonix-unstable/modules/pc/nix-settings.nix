{ config, pkgs, stable-pkgs, lib, ... }:

{
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];

    #hyprland cachix
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];

  };

  # Allow unfree packages globally for both stable and unstable package sets
  nixpkgs.config = {
    allowUnfree = true;

    # Optional: Allow specific unfree packages, e.g., unrar
    allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "unrar"
      "apple_cursor"
    ];
  };
}
