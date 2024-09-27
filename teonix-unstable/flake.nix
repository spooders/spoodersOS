{
  description = "Teos NixOS configuration with flakes";

  inputs = {
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    nixos-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-stable.url = "nixpkgs/nixos-24.05";  # Stable Nixpkgs
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    #chaotic.url = "https://flakehub.com/f/chaotic-cx/nyx/0.1.1219.tar.gz";
    #chaotic.url = "https://flakehub.com/f/chaotic-cx/nyx/0.1.1220.tar.gz";
    #chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
  };

  outputs = { self, nixos-stable, nixos-unstable, chaotic, ... } @ inputs:
  let
    system = "x86_64-linux"; 

    pkgs = import nixos-unstable {
      inherit system;
      config.allowUnfree = true; 
    };

    stable-pkgs = import nixos-stable {
      inherit system;
      config.allowUnfree = true; 
    };
    
    #pkgsCachy = import cachyos { inherit system; };  # CachyOS packages
  in {
    nixosConfigurations.nixbox = nixos-unstable.lib.nixosSystem {
      inherit system;

      specialArgs = {
        inherit stable-pkgs inputs;
      };

      modules = [
        ./modules/pc/bootloader.nix
        ./modules/pc/hardware.nix
        ./modules/pc/packages.nix
        ./modules/pc/environment.nix
        ./modules/pc/fonts.nix
        ./modules/pc/kernel.nix
        ./modules/pc/localization.nix
        ./modules/pc/networking.nix
        ./modules/pc/nix-settings.nix
        ./modules/pc/programs.nix
        ./modules/pc/system-services.nix
        ./modules/pc/users.nix
        ./modules/pc/virtualisation.nix
        ./modules/pc/xdgportal.nix

        # Modify this if 'cachyos.nixosModules.default' does not exist
        chaotic.nixosModules.default # OUR DEFAULT MODULE
      ];

    };
  };
}
