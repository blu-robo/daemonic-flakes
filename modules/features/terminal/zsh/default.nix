{ self, inputs, ... }: {
  flake.nixosModules.zsh = { pkgs, ... }: {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        nv = "nvim .";
	nrt = "sudo nixos-rebuild test --impure --flake .#daemonic-framework";
	nrs = "sudo nixos-rebuild switch --impure --flake .#daemonic-framework";
	gs = "git status";
	ga = "git add .";
	gc = "git commit";
	gp = "git push";
      };
      ohMyZsh = {
        enable = true;
        plugins = [
        ];
        theme = "";
      };
      histSize = 10000;
      interactiveShellInit = ''
        eval "$(starship init zsh)"
      '';
    };
  users.defaultUserShell = pkgs.zsh;
  };
}
