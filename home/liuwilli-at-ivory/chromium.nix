{
  lib,
  pkgs,
  ...
}: {
  programs.chromium = {
    enable = true;
    package = pkgs.ungoogled-chromium;
    # https://github.com/nix-community/home-manager/issues/2216
    # https://github.com/nix-community/home-manager/issues/2585
    extensions = let
      createChromiumExtensionFor = browserVersion: {
        id,
        sha256,
        version,
      }: {
        inherit id;
        crxPath = builtins.fetchurl {
          url = "https://clients2.google.com/service/update2/crx?response=redirect&acceptformat=crx2,crx3&prodversion=${browserVersion}&x=id%3D${id}%26installsource%3Dondemand%26uc";
          name = "${id}.crx";
          inherit sha256;
        };
        inherit version;
      };
      createChromiumExtension = createChromiumExtensionFor (lib.versions.major pkgs.ungoogled-chromium.version);
    in [
      (createChromiumExtension {
        id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";
        sha256 = "1lnk0k8zy0w33cxpv93q1am0d7ds2na64zshvbwdnbjq8x4sw5p6";
        version = "1.63.2";
      })
    ];
  };
}
