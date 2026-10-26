{ self, inputs, ... }: {
  flake.nixosModules.personal = { pkgs, lib, ... }: {
    programs.steam.enable = true;
    environment.systemPackages = with pkgs; [
      shotcut
      vesktop
      godot_4
      krita
      gimp
      nh
      wineWow64Packages.waylandFull
    ];
  };
}
