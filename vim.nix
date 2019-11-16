with import <nixpkgs> {};

let
  plugins = pkgs.callPackage ./vim-plugins.nix {};
  vimrcRaw = builtins.readFile (./. + "/vimrc");
  vimrcModified = builtins.replaceStrings [ "CLANG_UNWRAPPED" ] [ "${llvmPackages.clang-unwrapped.lib}/lib/libclang.so" ] vimrcRaw;
in
  neovim.override {
    configure = {
      customRC = vimrcModified;
      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [
          vim-addon-nix 
            llvmPackages.clang-unwrapped
            ctags
            fzf-vim 
            fzfWrapper 
            lightline-vim
            LanguageClient-neovim
            bear
            python27Packages.pyopenssl
            python37Packages.pyopenssl
            molokai
            plugins.vim_lsp_cxx_highlight
            plugins.tcomment 
            plugins.one
            plugins.onedark
            plugins.flygrep
            plugins.indentline
            plugins.coc-nvim
        ];
        opt = [ haskell-vim ];
      };
    };
  }
