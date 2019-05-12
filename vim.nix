with import <nixpkgs> {};

let
  plugins = pkgs.callPackage ./vim-plugins.nix {};
  vimrcContents = builtins.readFile (./. + "/vimrc");
in
  neovim.override {
    configure = {
      customRC = vimrcContents;
      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [
          vim-addon-nix 
            llvmPackages.clang-unwrapped
            ctags
            fzf-vim 
            fzfWrapper 
            lightline-vim
            molokai
            plugins.tcomment 
            plugins.one
            plugins.onedark
            plugins.flygrep
            plugins.indentline
            plugins.cpp-enhanced-highlight
            plugins.chromatica
        ];
        opt = [ haskell-vim plugins.c-vim ];
      };
    };
  }
