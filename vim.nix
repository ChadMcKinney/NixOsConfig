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
                  fzf-vim 
                  fzfWrapper 
                  lightline-vim
                  plugins.tcomment 
                  plugins.one
                  plugins.onedark
                  plugins.flygrep
                  plugins.indentline
                ];
                opt = [haskell-vim];
            };
        };
    }
