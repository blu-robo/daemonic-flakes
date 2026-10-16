{ self, moduleWithSystem, ... }: {
  flake.nixosModules.dev = moduleWithSystem ({ pkgs, ... }: let
    modules = with self.nixosModules; [
      git
      nvim
    ];
  in {
    imports = modules;
    virtualisation.docker.enable = true;
  });
}
    
