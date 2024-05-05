# theme.nix

{ config, pkgs, lib, ... }:
let
    gruvboxplus = import ./gruvbox-plus.nix { inherit pkgs lib; }; ## ensure 'lib' is passed as well as in the gruvbox or whatever nix gile you have.
in
{
gtk.enable = true;

gtk.cursorTheme.package = pkgs.bibata-cursors;
gtk.cursorTheme.name = "Bibata-Modern-Ice";

gtk.iconTheme.package = gruvboxplus;
gtk.iconTheme.name = "GruvboxPlus";


}