{ pkgs, ... }: {

  environment.systemPackages = [
    pkgs.python312Full
    virtualenv
  ];


}
