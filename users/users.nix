{ pkgs, config, username, host, ... }:

let
  inherit (import ./../hosts/${host}/options.nix) gitUsername theShell;
in {
  users.users = {
    "${username}" = {
      homeMode = "755";
      hashedPassword = "$6$MhH1/iCCjULUUD8s$q5Lkd2SR7e5bsVmAyeyEDk40Ynf/kC1Cj7MvcQUYQUk4GaA/O8yU65Vt6rezlcch5EVlLfVYWB.0hZs5Oup7A.";
      isNormalUser = true;
      description = "${gitUsername}";
      extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
      shell = pkgs.${theShell};
      ignoreShellProgramCheck = true;
      packages = with pkgs; [];
    };
    # "newuser" = {
    #   homeMode = "755";
    #   You can get this by running - mkpasswd -m sha-512 <password>
    #   hashedPassword = "$6$YdPBODxytqUWXCYL$AHW1U9C6Qqkf6PZJI54jxFcPVm2sm/XWq3Z1qa94PFYz0FF.za9gl5WZL/z/g4nFLQ94SSEzMg5GMzMjJ6Vd7.";
    #   isNormalUser = true;
    #   description = "New user account";
    #   extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    #   shell = pkgs.${theShell};
    #   ignoreShellProgramCheck = true;
    #   packages = with pkgs; [];
    # };
  };
}
