{ mobile-nixos
, fetchFromGitHub
, ...
}:

mobile-nixos.kernel-builder {
  version = "4.14.141";
  configfile = ./config.aarch64;

  /*src = fetchFromGitLab {
    owner = "ubports";
    repo = "porting/community-ports/android10/xiaomi-redmi-9/kernel-xiaomi-mt6768";
    rev = "c8b42ebb3b6a2cf562c605742f4c4679653924f5";
    sha256 = "sha256-mc6DJ9zZpGWDeX3oAp9RXgU5iVwFxQGQH5wGiajYHJ0=";
  };*/
  src = fetchFromGitHub {
    owner = "MiCode";
    repo = "Xiaomi_Kernel_OpenSource";
    rev = /*"d0b586e856dd638c73c34c3879536ca4ba73cd04";#*/"0f68431cdf9e396aa151ac7d764aab7d6eca7fc5";  #  branch lancelot-q-oss
    sha256 = /*"sha256-Ym1ppHjRXH4p2IJw68fyx2zm+xdTEWKt+vh8HLYnavc=";#*/"sha256-wQWbReSLAOIwdVPu655ubqh60MUb/yjcVXy9BIUGwVc=";
  };
  patches = [
    ./yyloc.patch
    ./shed.patch
  ];
  enableRemovingWerror = true;

  isModular = true;
}
