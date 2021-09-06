{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    buildInputs = [ pkgs.packer ];
    
 shellHook = ''
   unalias packer
 '';
 }
