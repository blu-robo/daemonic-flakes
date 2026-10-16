{ self, inputs, ... }: {              
  flake.nixosModules.nvim = { pkgs, lib, ... }: {
    imports = [ inputs.nvf.nixosModules.default ];

    programs.nvf = {
      enable = true;
      settings.vim = {
        theme = {
          enable = true;
          name = "catppuccin";
          style = "mocha";
          transparent = true;
        };
        opts = {
          tabstop = 2;
          shiftwidth = 0;
          ac = true;
          nu = true;
          rnu = true;
          et = true;
        };

        filetree.neo-tree = {
          enable = true;
          setupOpts = {
            enable_cursor_hijack = true;
            enable_git_status = true;
            filesystem.filtered_items.visible = true;
          };
        };
        
        statusline.lualine = {
          enable = true;
          setupOpts.options.icons_enabled = true;
        };
        
        treesitter = {
          enable = true;
        };
        
        languages = {
          nix = {
            enable = true;
            format.enable = true;
            lsp.enable = true;
          };
          clang = {
            enable = true;
            format.enable = true;
            lsp.enable = true;
          };
          tex = {
            enable = true;
            format.enable = true;
            lsp.enable = true;
          };
        };
        
        
        telescope.enable = true;
      };
    };
  };
}
