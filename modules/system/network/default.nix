{ self, inputs, ... }: {
  flake.nixosModules.network = { pkgs, lib, ... }: {
    networking = {
      networkmanager = {
        enable = true;
	dns = "none";
      };
      wireless.enable = true;
      firewall = {
        enable = false;
        checkReversePath = false;
      };
    };
    services.unbound = {
      enable = true;
    };
    environment.systemPackages = with pkgs; [
      wireguard-tools
      proton-vpn
    ];
    systemd.services.NetworkManager-wait-online.enable = false;
  };
}
