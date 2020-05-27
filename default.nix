{ pkgs ? import <nixpkgs> {} }:

let
  # 20.03
  rev = "5272327b81ed355bbed5659b8d303cf2979b6953";
  channel = fetchTarball "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
  config = {
    allowBroken = true;
  };
  papajaBuildInputs = with pkgs.rPackages; [
    afex
    base64enc
    beeswarm
    bookdown
    broom
    knitr
    rlang
    rmarkdown
    rmdfiltr
    yaml
  ];
  papaja = with pkgs.rPackages; buildRPackage {
    name = "papaja";
    src = pkgs.fetchFromGitHub {
      owner = "crsh";
      repo = "papaja";
      rev = "b0a224a5e67e1afff084c46c2854ac6f82b12179";
      sha256 = "14pxnlgg7pzazpyx0hbv9mlvqdylylpb7p4yhh4w2wlcw6sn3rwj";
    };
    # Do not add propagateddBuildInputs = papajaBuildInputs since
    # it might cause a buffer overflow when calling `devtools::document`.
    nativeBuildInputs = papajaBuildInputs;
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
      papaja
      pwr
      rmdfiltr
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
    glibcLocales # Avoids error in `devtools::check()`.
    haskellPackages.pandoc
    haskellPackages.pandoc-citeproc
    R-with-my-packages
    zip
  ];
}
