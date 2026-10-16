{ inputs, ... }: {
  perSystem = { system, ... }: {
    _module.args.unfreePkgs = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  };
  flake.nixosModules.nix = { ... }: {
    nix = {
      settings = {
        trusted-users = [ "root" "blu_robo" ];
	experimental-features = [ "nix-command" "flakes" ];
      };
      optimise.automatic = true;
      gc = {
        automatic = true;
	dates = "daily";
	options = "--delete-older-than 30d";
      };
    };
    nixpkgs = {
      config = {
        allowUnfree = true;
	packageOverrides = pkgs: {
	  unstable = import inputs.nixpkgs-unstable {
	    system = pkgs.stdenv.hostPlatform.system;
	    config = {
	      allowUnfree = true;
	    };
	  };
	};
      };
    };
  };
}
