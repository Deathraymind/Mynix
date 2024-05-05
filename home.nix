# home.nix
{ config, pkgs, lib, ... }:

{
   imports = [
    # ./startup.nix  # Adjust the path as necessary
    ./theme.nix
  ];

home.file."/home/bowyn/.profile".source = ./home/.profile;  # Adjust the path to where you store .profile in your flake

home.file."/home/bowyn/.config/hypr" = { # this is where you want the file
  source = ./home/config/hypr; # this is where you are pulling the file from
  recursive = true; # recusris the e ntire directory
};

home.file."/home/bowyn/.config/rofi" = { # this is where you want the file
  source = ./home/config/rofi; # this is where you are pulling the file from
  recursive = true; # recusris the e ntire directory
};

home.file."/home/bowyn/.config/kitty" = { # this is where you want the file
  source = ./home/config/kitty; # this is where you are pulling the file from
  recursive = true; # recusris the e ntire directory
};

home.file."/home/bowyn/.config/waybar" = { # this is where you want the file
  source = ./home/config/waybar; # this is where you are pulling the file from
  recursive = true; # recusris the e ntire directory
};


  # TODO please change the username & home directory to your own
  home.username = "bowyn";
  home.homeDirectory = "/home/bowyn";
  

  


  # set cursor size and dpi for 4k monitor
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  # Packages that should be installed to the user profile. w 
  home.packages = with pkgs; [
    # system tools
    kitty
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
    hyprland
    rofi
    #Themeing
    gtk3
    dconf
    glib
    gsettings-desktop-schemas
    # Browser
    firefox
    dolphin
    gnome.nautilus
  ];

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "Deathraymind";
    userEmail = "deathraymind@gmail.com";
  };


  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.starship.enable = false;


}