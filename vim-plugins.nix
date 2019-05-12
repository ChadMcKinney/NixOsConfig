{ pkgs, fetchgit }:

let
	buildVimPlugin = pkgs.vimUtils.buildVimPluginFrom2Nix;
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
		dependencies = [ pkgs.llvmPackages.clang-unwrapped ];
	};
}

