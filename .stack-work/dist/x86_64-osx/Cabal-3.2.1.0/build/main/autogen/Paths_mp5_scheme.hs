{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_mp5_scheme (
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
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/vitalypastukhov/class_app/MCS/CS421/MP5_MP6/release/mps/mp5-scheme/.stack-work/install/x86_64-osx/4ed69fdaec4f4c874f3b10dcc57471a002776d4c0fae75569bf20686567b7e46/8.10.4/bin"
libdir     = "/Users/vitalypastukhov/class_app/MCS/CS421/MP5_MP6/release/mps/mp5-scheme/.stack-work/install/x86_64-osx/4ed69fdaec4f4c874f3b10dcc57471a002776d4c0fae75569bf20686567b7e46/8.10.4/lib/x86_64-osx-ghc-8.10.4/mp5-scheme-0.1.0.0-D2PW8JCvrN1Bw2waSxFB5p-main"
dynlibdir  = "/Users/vitalypastukhov/class_app/MCS/CS421/MP5_MP6/release/mps/mp5-scheme/.stack-work/install/x86_64-osx/4ed69fdaec4f4c874f3b10dcc57471a002776d4c0fae75569bf20686567b7e46/8.10.4/lib/x86_64-osx-ghc-8.10.4"
datadir    = "/Users/vitalypastukhov/class_app/MCS/CS421/MP5_MP6/release/mps/mp5-scheme/.stack-work/install/x86_64-osx/4ed69fdaec4f4c874f3b10dcc57471a002776d4c0fae75569bf20686567b7e46/8.10.4/share/x86_64-osx-ghc-8.10.4/mp5-scheme-0.1.0.0"
libexecdir = "/Users/vitalypastukhov/class_app/MCS/CS421/MP5_MP6/release/mps/mp5-scheme/.stack-work/install/x86_64-osx/4ed69fdaec4f4c874f3b10dcc57471a002776d4c0fae75569bf20686567b7e46/8.10.4/libexec/x86_64-osx-ghc-8.10.4/mp5-scheme-0.1.0.0"
sysconfdir = "/Users/vitalypastukhov/class_app/MCS/CS421/MP5_MP6/release/mps/mp5-scheme/.stack-work/install/x86_64-osx/4ed69fdaec4f4c874f3b10dcc57471a002776d4c0fae75569bf20686567b7e46/8.10.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "mp5_scheme_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "mp5_scheme_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "mp5_scheme_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "mp5_scheme_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "mp5_scheme_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "mp5_scheme_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
