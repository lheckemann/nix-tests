{ ... }:

let
  pool = "tank";
  volumes = [ "/" "/nix" "/home" ];
in {
  boot.loader.grub.device = "/dev/sda";
  fileSystems = [
    { device = "/dev/sda1"; mountPoint = "/data"; fsType = "xfs"; }
  ] ++ (map (v: { device = "${pool}${v}"; mountPoint = v; fsType = "zfs"; }) volumes);
  networking.hostId = "fe1f6cbf";
}
