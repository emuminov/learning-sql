with import <nixpkgs> {};
mkShell {
  packages = [ mariadb_114 ];
}
