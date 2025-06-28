{self, ...}: {
  perSystem = _: {
    packages = let
      homeConfig = self.homeConfigurations."liuwilli@ivory".config;
    in {
      neovim = homeConfig.programs.nvf.settings.vim.build.finalPackage;
      firefox = homeConfig.programs.firefox.finalPackage;
    };
  };
}
