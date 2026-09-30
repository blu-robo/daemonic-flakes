{ self, inputs, ... }: { 
  flake.nixosModules.niri = { pkgs, lib, ... }: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
    };
  };
  perSystem = { pkgs, lib, inputs', self', ... }: {
    packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;	
      settings = {
	layout.gaps = 5;
	input = {
          focus-follows-mouse = {};
	  touchpad = {
	    natural-scroll = {};
	  };
	};
	spawn-at-startup = [
	  (lib.getExe self'.packages.myNoctalia)
	  "${lib.getExe inputs'.zen-browser.packages.default}"

	];
  outputs = {
    "eDP-1" = {
      mode = "2880x1920@60.000";
    };
  };
	binds = {
	  "Mod+Q".spawn-sh = lib.getExe self'.packages.kitty;
	  "Mod+C".close-window = {};
          "Mod+S".screenshot = {};
          "Mod+H".focus-column-left = {};
          "Mod+J".focus-workspace-down = {};
          "Mod+K".focus-workspace-up = {};
          "Mod+L".focus-column-right = {};
	  "Mod+R".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call launcher toggle";
	  "Mod+XF86MonBrightnessUp".spawn-sh = "${pkgs.brightnessctl}/bin/brightnessctl set 60%";
          "Mod+XF86MonBrightnessDown".spawn-sh = "${pkgs.brightnessctl}/bin/brightnessctl set 20%";
          "XF86MonBrightnessUp".spawn-sh = "${pkgs.brightnessctl}/bin/brightnessctl set 5%+";
	  "XF86MonBrightnessDown".spawn-sh = "${pkgs.brightnessctl}/bin/brightnessctl set 5%-";
	  "XF86AudioMute".spawn-sh = "${pkgs.pulseaudio}/bin/pactl set-sink-mute @DEFAULT_SINK@ toggle";
	  "XF86AudioRaiseVolume".spawn-sh = "${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ +5%";
	  "XF86AudioLowerVolume".spawn-sh = "${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ -5%";
	};
      };
    };
  };
}
