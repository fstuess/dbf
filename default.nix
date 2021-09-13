{ mkDerivation, base, binary, bytestring, lib, monad-loops, rwlock
, template-haskell
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
}
