{ config, pkgs, ... }:

{
  #xdg.portal = {
  #  enable = true;
  #  wlr.enable = true;

  #  extraPortals = [
  #    #pkgs.xdg-desktop-portal-gtk
  #    pkgs.xdg-desktop-portal
  #    pkgs.xdg-desktop-portal-wlr
  #  ];

  #  configPackages = [
  #    pkgs.xdg-desktop-portal-gtk
  #    pkgs.xdg-desktop-portal-hyprland
  #    pkgs.xdg-desktop-portal
  #  ];
  #};

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      #pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal
      pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-kde
      pkgs.xdg-desktop-portal-gnome
    ];

    configPackages = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-kde
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal
    ];
  };
}
