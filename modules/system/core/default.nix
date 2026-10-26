{ self, inputs, ... }: {
  flake.nixosModules.core = { pkgs, lib, ... }: let
    modules = with self.nixosModules; [
      user
      nix
      locale
      bootloader
      network
      audio
    ];
  in {
    imports = 
      [
        /etc/nixos/hardware-configuration.nix
      ]
      ++modules;
    services = {
      upower.enable = true;
      openssh.enable = true;
      xserver.enable = true;
    };
    environment.systemPackages = with pkgs; [
      wget
      unzip
      usbutils
      python315
      curl
      p7zip-rar
      libnotify
      btop
    ];
    system.stateVersion = "26.05";
  };
}
