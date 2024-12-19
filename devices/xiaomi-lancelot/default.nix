{ config, lib, pkgs, ... }:

{
  mobile.device.name = "xiaomi-lancelot";
  mobile.device.identity = {
    name = "Redmi 9";
    manufacturer = "Xiaomi";
  };
  mobile.device.supportLevel = "best-effort";

  mobile.hardware = {
    soc = "mediatek-mt6769";
    ram = 1024 * 3; # There is a 6GB version
    screen = {
      width = 1080; height = 2340;
    };
  };

  mobile.boot.stage-1 = {
    kernel.package = pkgs.callPackage ./kernel {};
  };

  mobile.system.type = "android";

  mobile.system.android.device_name = "lancelot";
  mobile.system.android = {# This is extremely wrong
    bootimg.flash = {
      offset_base = "0x80000000";
      offset_kernel = "0x00008000";
      offset_ramdisk = "0x01000000";
      offset_second = "0x00f00000";
      offset_tags = "0x00000100";
      pagesize = "2048";
    };
    appendDTB = [
      "dtbs/qcom/sdm625-motorola-potter.dtb"
    ];
  };

  #mobile.device.firmware = pkgs.callPackage ./firmware {};
  mobile.boot.stage-1 = {
    compression = "xz";
  };

  mobile.usb.mode = "gadgetfs";
  # The identifiers used here serve as a compatible well-known identifier.
  mobile.usb.idVendor = lib.mkDefault "18D1"; # Google
  mobile.usb.idProduct = lib.mkDefault "D001"; # "Nexus 4"

  mobile.usb.gadgetfs.functions = {
    adb = "ffs.adb";
    mass_storage = "mass_storage.0";
    rndis = "rndis.usb0";
  };
}
