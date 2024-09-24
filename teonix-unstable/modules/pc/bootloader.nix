
{ config, ... }:

{
  system.stateVersion = "24.05";  # Match your NixOS version

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;

    # early kms
    initrd.kernelModules = [ "amdgpu" ];
  };
}
