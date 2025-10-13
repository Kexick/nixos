{
  programs.git = {
    enable = true;
    userName = "Kexick";
    userEmail = "trogister.to@gmail.com";
    includes = [
      {
        path = "~/.config/git/gitconfig-gitlab.inc";
        condition = "gitdir:~/Project/21-school";
        contents.user.name = "Flathead Alexis";
        contents.user.mail = "flatheaa@student.21-school.ru";
      }
    ];
  };
  xdg.configFile."git/gitconfig-gitlab.inc".text = ''
    [user]
      name = Flathead Alexis
      email = flatheaa@student.21-school.ru
  '';
}
