{lib, ...}: {
  importNixModules = dir:
    lib.filter
    (p: let
      s = toString p;
    in
      lib.hasSuffix ".nix" s
      && baseNameOf p != "default.nix"
      && !(lib.hasInfix "/_" s))
    (lib.filesystem.listFilesRecursive dir);
}
