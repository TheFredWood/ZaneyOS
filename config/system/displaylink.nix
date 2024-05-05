{ pkgs, config, lib, host, ... }:{

  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "displaylink" "modesetting" ];
}
