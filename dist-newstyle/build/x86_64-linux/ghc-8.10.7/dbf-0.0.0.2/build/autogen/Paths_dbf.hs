{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_dbf (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,0,0,2] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/funk/.cabal/bin"
libdir     = "/home/funk/.cabal/lib/x86_64-linux-ghc-8.10.7/dbf-0.0.0.2-inplace"
dynlibdir  = "/home/funk/.cabal/lib/x86_64-linux-ghc-8.10.7"
datadir    = "/home/funk/.cabal/share/x86_64-linux-ghc-8.10.7/dbf-0.0.0.2"
libexecdir = "/home/funk/.cabal/libexec/x86_64-linux-ghc-8.10.7/dbf-0.0.0.2"
sysconfdir = "/home/funk/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "dbf_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "dbf_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "dbf_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "dbf_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "dbf_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "dbf_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
