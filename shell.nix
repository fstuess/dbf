{ nixpkgs ? import <nixpkgs> {}, compiler ? "default", doBenchmark ? false }:

let

  inherit (nixpkgs) pkgs;

  f = { mkDerivation, base, binary, bytestring, lib, monad-loops
      , rwlock, template-haskell
      }:
      mkDerivation {
        pname = "dbf";
        version = "0.0.0.2";
        src = ./.;
        libraryHaskellDepends = [
          base binary bytestring monad-loops rwlock template-haskell
        ];
        homepage = "https://github.com/mokus0/dbf";
        description = "Read and write XBase \".dbf\" files";
        license = lib.licenses.publicDomain;
      };

  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  variant = if doBenchmark then pkgs.haskell.lib.doBenchmark else pkgs.lib.id;

  drv = variant (haskellPackages.callPackage f {});

in

  if pkgs.lib.inNixShell then drv.env else drv
