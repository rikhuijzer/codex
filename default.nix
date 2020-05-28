{ pkgs ? import <nixpkgs> {} }:

let
  rev = "5272327b81ed355bbed5659b8d303cf2979b6953";
  channel = fetchTarball "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
  pkgs = import channel {};
  my-r-packages = with pkgs.rPackages; [
      devtools
      dplyr
      effsize
      git2r
      gridExtra
      pwr
      rprojroot
      svglite
      tidyverse
      xts
      XLConnect
      XLConnectJars
  ];
  R-with-my-packages = pkgs.rWrapper.override{
    packages = my-r-packages;
  };
in pkgs.mkShell {
  name = "env";
  buildInputs = with pkgs; [
    glibcLocales # Avoids error in `devtools::check()`.
    haskellPackages.pandoc
    haskellPackages.pandoc-citeproc
    R-with-my-packages
  ];
}
