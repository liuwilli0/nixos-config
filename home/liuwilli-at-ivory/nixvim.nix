_: {
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    clipboard.providers.wl-copy.enable = true;

    opts = {
      softtabstop = 3;
      shiftwidth = 4;
      expandtab = true;

      list = true;
      wrap = false;
      listchars = "tab:>·,extends:»,precedes:«,trail:·,nbsp:·";
    };

    files = {
      "ftplugin/nix.lua".opts = {
        softtabstop = 2;
        shiftwidth = 2;
      };
    };

    plugins = {
      lualine.enable = true;
      bufferline.enable = true;
      treesitter.enable = true;
      telescope.enable = true;
      nvim-surround.enable = true;
      trouble.enable = true;
      gitsigns.enable = true;
      web-devicons.enable = true;

      lsp = {
        enable = true;
        servers = {
          ts_ls.enable = true;
          clangd.enable = true;
          nixd.enable = true;

          rust_analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
            installRustfmt = true;
          };
        };
      };
    };
  };
}
