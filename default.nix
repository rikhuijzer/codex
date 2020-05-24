{ pkgs ? import <nixpkgs> {} }:

let
  # 20.03
  rev = "5272327b81ed355bbed5659b8d303cf2979b6953";
  channel = fetchTarball "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
  config = {
    allowBroken = true;
  };
  pkgs = import channel { inherit config; };
  my-r-packages = with pkgs.rPackages; [
      bookdown
      devtools
      dplyr
      effsize
      forestplot
      git2r
      gridExtra
      pwr
      rprojroot
      svglite
      tidyverse
      xts
      XLConnect # Excel files.
      XLConnectJars
  ];
  R-with-my-packages = pkgs.rWrapper.override{
    packages = my-r-packages;
  };
in pkgs.mkShell {
  name = "env";
  buildInputs = with pkgs; [
    git
    R-with-my-packages
  ];
}
