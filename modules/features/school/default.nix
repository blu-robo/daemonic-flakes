{ self, inputs, ... }: {
  flake.nixosModules.school = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      obsidian
      libreoffice-qt
      imagemagick
    ];
    services = {
      avahi = {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
      };
      printing.enable = true;
    };
  };
}
