{lib, ...}: {
  importNixModules = dir: let
    entries = builtins.readDir dir;
    names = builtins.attrNames entries;

    nixFiles =
      lib.filter (
        name:
          entries.${name}
          == "regular"
          && lib.hasSuffix ".nix" name
          && name != "default.nix"
      )
      names;
  in
    map (name: dir + "/${name}") nixFiles;
}
# {
#   imports = lib.filter (n: lib.strings.hasSuffix ".nix" n) (
#     lib.filesystem.listFilesRecursive ./modules
#   );
# }

