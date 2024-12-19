{ mobile-nixos
, fetchFromGitHub
, ...
}:

mobile-nixos.kernel-builder {
  version = "4.14.141";
  configfile = ./config.aarch64;

  src = fetchFromGitHub {
    owner = "MiCode";
    repo = "Xiaomi_Kernel_OpenSource";
    rev = "0f68431cdf9e396aa151ac7d764aab7d6eca7fc5";  #  branch lancelot-q-oss
    sha256 = "";
  };

  isModular = true;
}
