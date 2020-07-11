{ pkgs, vimUtils, fetchgit }:

with vimUtils;

let
	buildVimPlugin = pkgs.vimUtils.buildVimPluginFrom2Nix;
    yarn2nix = pkgs.callPackage (pkgs.fetchFromGitHub {
        owner = "moretea";
        repo = "yarn2nix";
        rev = "780e33a07fd821e09ab5b05223ddb4ca15ac663f";
        sha256 = "1f83cr9qgk95g3571ps644rvgfzv2i4i7532q8pg405s4q5ada3h";
        }) {};
in {
  "tcomment" = buildVimPlugin {
    name = "tcomment";
    src = fetchgit {
      url = "https://github.com/tomtom/tcomment_vim.git";
      rev = "622cc0551bef87a3dfb2846cb339412eeb8ef133";
      sha256 = "0zd23520hn5lflcz2jpi22x13kvmy6ry7qqzbi438xyw4j4gwpfs";
    };
    dependencies = [];
  };

	"miramare" = buildVimPlugin {
		name = "miramare";
		src = fetchgit {
			url = "https://github.com/franbach/miramare.git";
			rev = "89643afaa8c4f2cdc62e0d16083ed876ad01a945";
			sha256 = "1q6gn6cj8nbvp0l7d6fhpi60mmmpl2kpkln9lq16yq6xnkwi2jk9";
		};
		dependencies = [];
	};

	"polyglot" = buildVimPlugin {
		name = "polyglot";
		src = fetchgit {
			url = "https://github.com/sheerun/vim-polyglot.git";
			rev = "9c3c0bc082e0d58d15dc6f24d8a335931417e2f0";
			sha256 = "0pdfq512qh54zj24iwihr30xb8dxw67ix2yj0sb88qy07phab8k2";
		};
		dependencies = [];
	};

	"haskellSyntax" = buildVimPlugin {
		name = "haskellSyntax";
		src = fetchgit {
			url = "https://github.com/ChadMcKinney/haskell_syntax.vim.git";
			rev = "c4d1d372529a0f24650f00fc5a4a57bf05da6e38";
			sha256 = "1xr0m38if8ss7zvsnhjjlwlf89mbf2kbwbs58g38jvd9bdcaky16";
		};
		dependencies = [];
	};

	"solarized" = buildVimPlugin {
		name = "solarized";
		src = fetchgit {
			url = "https://github.com/lifepillar/vim-solarized8.git";
			rev = "5df7666374ead07a482605b53a0f36c27dc17e8d";
			sha256 = "1nvlb00lajzbhfsbsjw6f7hi37xrnyfhf0a7cgjvf3jp2piwjs2d";
		};
		dependencies = [];
	};

	"onedark" = buildVimPlugin {
		name = "onedark";
		src = fetchgit {
			url = "https://github.com/joshdick/onedark.vim.git";
			rev = "7f36f83f13d3bdbd3dca4e3e8b2a10a5ecdca5e9";
			sha256 = "0cnn3j3invasqh5sn20gf9lvcksqhracrbyr3pn3fs9shp7f1kxw";
		};
		dependencies = [];
	};

	"one" = buildVimPlugin {
		name = "one";
		src = fetchgit {
			url = "https://github.com/rakr/vim-one.git";
			rev = "6695e135415c53a8fbe96672e382200aa1ffb4b4";
			sha256 = "0951r9kw23zlwd7fda6ib2d9k0akpfd2hvh82pasgw3ks9v1n2vf";
		};
		dependencies = [];
	};

	"onehalf" = buildVimPlugin {
		name = "onehalf";
		src = fetchgit {
			url = "https://github.com/sonph/onehalf.git";
			rev = "c0f08a297e69bc2826f748949e7ce4f0532797ee";
			sha256 = "0lg5bn5wa5mi7ldghnfwgkiprzs11is2pgsxc9a79wd7skr00smp";
		};
		dependencies = [];
	};

	"flygrep" = buildVimPlugin {
		name = "flygrep";
		src = fetchgit {
			url = "https://github.com/wsdjeg/FlyGrep.vim.git";
			rev = "1eef1a3265635b62d69b8a37c581c7d13e7adae2";
			sha256 = "1pw75srk3zwhq6w81ybxkvqi2jh4asffj3hhh6il71v3zcgz9w4n";
		};
		dependencies = [];
	};

	"indentline" = buildVimPlugin {
		name = "indentline";
		src = fetchgit {
			url = "https://github.com/Yggdroot/indentLine.git";
			rev = "47648734706fb2cd0e4d4350f12157d1e5f4c465";
			sha256 = "0739hdvdfa1lm209q4sl75jvmf2k03cvlka7wv1gwnfl00krvszs";
		};
		dependencies = [];
	};

	"c-vim" = buildVimPlugin {
		name = "c-vim";
		src = fetchgit {
			url = "https://github.com/vim-jp/vim-cpp.git";
			rev = "1ddd7e39567d847526b806bd28fede509a505e6c";
			sha256 = "1782jbff2h3zbp7dilprbrchi0qpj5xdgpb8bb4b6z741v4fh8p3";
		};
		dependencies = [ ];
	};

	"cpp-enhanced-highlight" = buildVimPlugin {
		name = "cpp-enhanced-highlight";
		src = fetchgit {
			url = "https://github.com/octol/vim-cpp-enhanced-highlight.git";
			rev = "3aa95627380501d9ce77eb8ff5dcf889d0d0ac41";
			sha256 = "15vsmqlpsxq0wjz5yq1kmnghv159842zsv88ylmjw6arvb11zmic";
		};
		dependencies = [ ];
	};

	"chromatica" = buildVimPlugin {
		name = "chromatica";
		src = fetchgit {
			url = "https://github.com/arakashic/chromatica.nvim.git";
			rev = "024cf1e8e8bb282eb47fe1c47892947363aa9c67";
			sha256 = "12x0012qi6q6hhgqarm7gn5gv9ksn44hdy1k7m4kd7a7mgi64pry";
		};
		dependencies = [ pkgs.llvm pkgs.llvmPackages.clang-unwrapped pkgs.python37 pkgs.python37Packages.pynvim ];
	};

	"DyeVim" = buildVimPlugin {
		name = "DyeVim";
		src = fetchgit {
			url = "https://github.com/davits/DyeVim.git";
			rev = "b915e4ddc3d9b4b5365ce264ce1e7c1b13281915";
			sha256 = "0s35l13qdr1hkc3yxrrj8x13fp7rj97qqibmd103dsilz4jspdif";
		};
		dependencies = [ pkgs.vimPlugins.YouCompleteMe ];
	};

	"color_coded" = buildVimPlugin {
		name = "color_coded";
		src = fetchgit {
			url = "https://github.com/jeaye/color_coded.git";
			rev = "16e71d6f5850849c6ffc9a06a7c952e27d351866";
			sha256 = "0cvh9r4j8177z3sqvbk15dylj76r3qfz1z5qhar3rg42b7hhir5l";
		};
		dependencies = [ pkgs.llvm pkgs.llvmPackages.clang-unwrapped pkgs.ncurses pkgs.zlib pkgs.xz pkgs.lua ];
	};

	"clamp" = buildVimPlugin {
		name = "clamp";
		src = fetchgit {
			url = "https://github.com/bbchung/Clamp.git";
			rev = "ae4b8663ce69378a5d42f44f51ee2ac06920faf2";
			sha256 = "0mvvgrwrp09qai8vq3mzrmicxd8h0f47zzsxvm6kpxqfy8i38n04";
		};
		dependencies = [ pkgs.llvm pkgs.llvmPackages.clang-unwrapped pkgs.python37Packages.pynvim pkgs.python37 ];
	};

	"vim_lsp_cxx_highlight" = buildVimPlugin {
		name = "vim_lsp_cxx_highlight";
		src = fetchgit {
			url = "https://github.com/jackguo380/vim-lsp-cxx-highlight";
			rev = "4df127d606f61a3701df73b1b72be0245621c325";
			sha256 = "08a2i717ifgqfn7ri2ciskfhykxzqg631864n213b6p6yhhpmfnj";
		};
		dependencies = [ pkgs.vimPlugins.LanguageClient-neovim pkgs.cquery pkgs.ccls ];
	};

	"cxxd" = buildVimPlugin {
		name = "cxxd";
		src = fetchgit {
			url = "https://github.com/JBakamovic/cxxd.git";
			rev = "06d2743cb11fb4c89e69314f60b7e599e2040aef";
			sha256 = "18f0kyixg2yj53yw5imq4ldrv7fdilykdrsrx8i3b1rpbp5z0fns";
		};
		dependencies = [ pkgs.llvm pkgs.llvmPackages.clang-unwrapped pkgs.python27Packages.pynvim pkgs.python27 pkgs.clang-tools ];
	};

	"cxxd-vim" = buildVimPlugin {
		name = "cxxd-vim";
		src = fetchgit {
			url = "https://github.com/JBakamovic/cxxd-vim.git";
			rev = "38049ac503352abbb17506ce47f3075bc5944fd3";
			sha256 = "0l5qmqzqlicribmfbr3nriqzk39zf80a81hds35xpv8f60767gx0";
		};
		dependencies = [ pkgs.llvm pkgs.llvmPackages.clang-unwrapped pkgs.python27Packages.pynvim pkgs.python27 pkgs.clang-tools ];
	};

    "coc-nvim" = let
      pname = "coc.nvim";
      version = "0.0.74";

      src = fetchgit {
        url = "https://github.com/neoclide/coc.nvim.git";
        rev = "dcd602ce1bc64e909ad19f057c868717bb429380";
        sha256 = "0412q50sf5biliakqqi5srd9piqca5ij76vyic4zl0s2lw64y16w";
      };

      deps = yarn2nix.mkYarnModules rec {
        inherit version pname;
        name = "${pname}-modules-${version}";
        packageJSON = src + "/package.json";
        yarnLock = src + "/yarn.lock";
      };

      in buildVimPluginFrom2Nix {
        inherit version pname src;
		dependencies = [ pkgs.nodejs ];

        configurePhase = ''
          mkdir -p node_modules
          ln -s ${deps}/node_modules/* node_modules/
          ln -s ${deps}/node_modules/.bin node_modules/
          '';

        buildPhase = ''
          ${pkgs.yarn}/bin/yarn build
          '';

        postFixup = ''
          substituteInPlace $target/autoload/coc/util.vim \
          --replace "'yarnpkg'" "'${pkgs.yarn}/bin/yarnpkg'"
          substituteInPlace $target/autoload/health/coc.vim \
          --replace "'yarnpkg'" "'${pkgs.yarn}/bin/yarnpkg'"
          '';
      };
}
