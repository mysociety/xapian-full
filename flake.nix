{
  description = "Development environment for Ruby Xapian bindings";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:

  flake-utils.lib.eachDefaultSystem (
    system: let
      pkgs = nixpkgs.legacyPackages.${system};
      ruby = pkgs.ruby_3_2;
    in {
      devShells.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          pkg-config

          file # libmagic
          zlib
          pcre2
          boost

          xapian
          ruby

          doxygen
          help2man
          graphviz
          pngcrush
          docutils
        ];

        shellHook = ''
          export RUBY_VERSION=${ruby.version}
          export GEM_HOME=$PWD/.bundle/$RUBY_VERSION
          export GEM_PATH=$GEM_PATH:$GEM_HOME
          export PATH=$GEM_HOME/bin:$PATH
        '';
      };
    }
    );
  }
