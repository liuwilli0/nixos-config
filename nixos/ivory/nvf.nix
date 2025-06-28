{
  programs.nvf = {
    enable = true;

    settings.vim = {
      options = {
        expandtab = true;
        shiftwidth = 4;

        list = true;
        wrap = false;
        listchars = "tab:>·,extends:»,precedes:«,trail:·,nbsp:·";
      };

      autocmds = [
        {
          event = ["FileType"];
          pattern = ["nix"];
          command = "setlocal shiftwidth=2";
        }
      ];

      lsp.enable = true;

      languages = {
        enableTreesitter = true;

        nix.enable = true;
        rust.enable = true;
      };

      statusline.lualine.enable = true;
    };
  };
}
