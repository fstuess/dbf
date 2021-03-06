# default.nix
let 
  pkgs = import <nixpkgs> { };
in 
  pkgs.haskellPackages.developPackage {
    root = ./.;
    modifier = drv:
      pkgs.haskell.lib.addBuildTools drv (with pkgs.haskellPackages;
        [ cabal-install
          cabal2nix
          ghcid
          hlint
          haskell-language-server
        ]);
  }
