{ self, inputs, ... }: {
  flake.nixosModules.personal = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      shotcut
      vesktop
      godot_4
      krita
      gimp
      nh
    ];
  };
}
