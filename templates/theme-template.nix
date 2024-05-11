# template-theme.nix

{ config, pkgs, lib, ... }: 
let
    gruvboxplus = import ./gruvbox-plus.nix { inherit pkgs lib; }; ## ensure 'lib' is passed as well as in the gruvbox or whatever nix gile you have.
    # ^ this is the "package name" below
in
{
gtk.enable = true;

gtk.cursorTheme.package = pkgs.bibata-cursors;
gtk.cursorTheme.name = "Bibata-Modern-Ice";

gtk.theme.package = pkgs.packagename; # the pkgs. is to tell nix os to download 
gtk.theme.name = "name of theme folder"; # this is not the name of the package but the theme itself may haveto look at github to find

gtk.iconTheme.package = gruvboxplus; # this is defined by the import variabe above note there is no pkgs. for this as its made by us 
gtk.iconTheme.name = "GruvboxPlus"; 


}