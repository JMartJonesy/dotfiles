{ ... }:

{
  services.xserver = {
    xkb = {
      layout = "us";
      variant = "";
    };
    videoDrivers = ["nvidia"];
  };
}
