# This file was generated by go2nix.
with import <nixpkgs> {};

with goPackages;

buildGoPackage rec {
  name = "go2nix-${version}";
  version = "20160308-${stdenv.lib.strings.substring 0 7 rev}";
  rev = "fd5dacf1a8da65964be801052eada09ca29c8650";
  
  goPackagePath = "github.com/kamilchm/go2nix";

  src = ./.;

  extraSrcs = map ( jsonDep:
    {
      inherit (jsonDep) goPackagePath;
      src = if jsonDep.fetch.type == "git" then
        fetchgit {
          inherit (jsonDep.fetch) url rev sha256;
        }
        else {};
    }
  ) (builtins.fromJSON (builtins.readFile ./deps.json));
}