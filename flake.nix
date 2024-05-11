# flake.nix
{
  description = "NixOS configuration";

  inputs = {
    
<<<<<<< HEAD
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable"; # unstable channel from nix
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11"; # nixos stable repository
    
    

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11"; # this downloads the homemanager from github
=======
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    # home-manager, used for managing user configuration
    

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,s
      # to avoid problems caused by different versions of nixpkgs.
>>>>>>> 8538cfd25904310cafc2d19c18be1c440c389b87
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      # TODO please change the hostname to your own
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          /etc/nixos/configuration.nix
          
          # make home-manager as a module of nixos
          # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            

           
<<<<<<< HEAD
            home-manager.users.bowyn = import /etc/nixos/home.nix; # This lines calls the file home.nix 
            
=======
            home-manager.users.bowyn = import /etc/nixos/home.nix;
            


            # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
>>>>>>> 8538cfd25904310cafc2d19c18be1c440c389b87
          }
        ];
      };
    };
  };
}