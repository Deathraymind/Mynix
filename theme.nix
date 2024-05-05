# template-theme.nix

{ config, pkgs, lib, ... }: 
{
qt.enable = true;
qt.platformTheme = "gtk";
qt.style.name = "adwaita-dark";
qt.style.package = pkgs.adwaita-qt;
gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Compact-Pink-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = ["pink"];
        variant = "mocha";
        size = "compact";
      };
    };
    iconTheme = {
      name = "Tela-circle-dark";
      package = pkgs.tela-circle-icon-theme;
    };
};
}