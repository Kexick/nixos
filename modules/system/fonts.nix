{pkgs, ... }:{
  
  fonts.packages = with pkgs; [
    dejavu_fonts
    dina-font
    fira-code
    fira-code-symbols
    hack-font
    liberation_ttf
    mplus-outline-fonts.githubRelease
    nerd-fonts.droid-sans-mono
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.ubuntu
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    proggyfonts
    roboto-mono
    ubuntu-sans
    ubuntu-sans-mono
    vista-fonts
  ];
}
