{
  lib,
  buildLua,
  fetchFromGithub,
  makeFontsConf,
}:
buildLua (finalAttrs: {
  pname = "mpv-osc-modern-f";
  version = "Sep 17, 2024";

  scriptPath = "modernf.lua";
  src = fetchFromGithub {
    owner = "FinnRaze";
    repo = "mpv-osc-modern-f";
    rev = "v${finalAttrs.version}";
    hash = "491acbd29cd4cf14b62c61110e9e51d697d59495";
  };

  postInstall = ''
    mkdir -p $out/share/fonts
    cp -r *.ttf $out/share/fonts
  '';
  passthru.extraWrapperArgs = [
    "--set"
    "FONTCONFIG_FILE"
    (toString (makeFontsConf {
      fontDirectories = [ "${finalAttrs.finalPackage}/share/fonts" ];
    }))
  ];
  })
