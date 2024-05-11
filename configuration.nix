# configuration.nix
{ config, pkgs, inputs, lib, ... }:


{
  imports =
    [ 
      (fetchTarball "https://github.com/nix-community/nixos-vscode-server/tarball/master") # this includes the nix os vs code server. 
      
      ./hardware-configuration.nix # Include the results of the hardware scan.
      
    ];

# run these two commands
# sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos-unstable
# sudo nix-channel --update
# append unstable. to the package you want to pull from the unstable channel
nixpkgs.config.packageOverrides = pkgs: {
    unstable = import <nixos-unstable> {
        config = config.nixpkgs.config;
    };
};


  

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant. 

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";


  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.bowyn = {
    isNormalUser = true;
    description = "bowyn";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };





#,------.                ,--.     ,--.                 
#|  .-.  \  ,---.  ,---. |  |,-.,-'  '-. ,---.  ,---.  
#|  |  \  :| .-. :(  .-' |     /'-.  .-'| .-. || .-. | 
#|  '--'  /\   --..-'  `)|  \  \  |  |  ' '-' '| '-' ' 
#`-------'  `----'`----' `--'`--' `--'   `---' |  |-'  
#                                             `--'    

  programs.hyprland = {
    # Install the packages from nixpkgs
    enable = true;
    # Whether to enable XWayland
    xwayland.enable = true;
  };

 
 
   # Disable X server as Hyprland is a Wayland compositor

  # Configure SDDM correctly within the displayManager option






  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  
#,------.               ,--.                                 
#|  .--. ' ,--,--. ,---.|  |,-. ,--,--. ,---.  ,---.  ,---.  
#|  '--' |' ,-.  || .--'|     /' ,-.  || .-. || .-. :(  .-'  
#|  | --' \ '-'  |\ `--.|  \  \\ '-'  |' '-' '\   --..-'  `) 
#`--'      `--`--' `---'`--'`--'`--`--'.`-  /  `----'`----'  
#                                     `---'          
  
  environment.systemPackages = with pkgs; [
    git
    kitty
    vscode
    waybar
    rofi
    nerdfonts

    # audio
    pipewire
    pamixer
    # network
    networkmanager
    networkmanagerapplet
    # bluetooth
    bluez
    blueman
    brightnessctl
    
    dunst # this is the notification daemon.
    

    # screenshot
    grimblast
    slurp
    swappy
    cliphist

    # dependencies
    polkit-kde-agent
    xdg-desktop-portal-hyprland
    parallel
    jq
    imagemagick
    ffmpegthumbs
    kde-cli-tools

    # theme stuff
    nwg-look
    qt5ct
    qt6ct
    
    hyprland 
    neofetch
    unstable.hyprlock # The unstable. is puleld from the unstable channle of nixos
    pavucontrol 
    pipewire
    steam


  ];


  fonts.fonts = with pkgs; [
    nerdfonts # this pulls the nerdfonts from the nixos and makes it available. 
  ];

  





#,---.                          ,--.                     
#'   .-'  ,---. ,--.--.,--.  ,--.`--' ,---. ,---.  ,---.  
#`.  `-. | .-. :|  .--' \  `'  / ,--.| .--'| .-. :(  .-'  
#.-'    |\   --.|  |     \    /  |  |\ `--.\   --..-'  `) 
#`-----'  `----'`--'      `--'   `--' `---' `----'`----'  
                                                         
  services.openssh.enable = true; # enables the sshd server on the computer
  services.openssh.permitRootLogin = "yes";  # // or "no" if you want to disable root login
  services.openssh.passwordAuthentication = true; # // or false to disable password authentication
  
  services.vscode-server.enable = true; # this enables the vs code server. 
  nix.settings.experimental-features = [ "nix-command" "flakes" ]; # this is a nixos experimental feature called flakes

 
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = false;
  # If you want to use JACK applications, uncomment this
  # systemctl --user restart pipewire.service
  # systemctl --user restart pipewire-pulse.service
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
 



  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.

  # Enable networking
  networking.networkmanager.enable = true; # Enables dhcp and ethernet support IMPORTANT
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}