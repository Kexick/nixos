{
  xdg.configFile."clangd/config.yaml".text = ''
    CompileFlags:
      Add: [-Wall, -Wextra]

    If:
      PathMatch: .*\.(c|h)$
    CompileFlags:
      Add: [-std=c11]

    If:
      PathMatch: .*\.(cc|cpp|cxx|hpp|hh|hxx)$
    CompileFlags:
      Add: [-std=c++20]
  '';
}
