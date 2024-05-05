# theme.nix
{ config, pkgs, lib, ... }:
{
catppuccin.enable = true;
catppuccin.flavour = "mocha";
gtk.enable = true;
qt.enable = true; 

gtk.cursorTheme.package = pkgs.bibata-cursors;
gtk.cursorTheme.name = "Bibata-Modern-Ice";
}