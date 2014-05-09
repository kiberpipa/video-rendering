with import <nixpkgs> { 
  config.allowUnfree = true; 
  config.ffmpeg.fdk = true;
};

stdenv.mkDerivation rec {
  name = "pipa-render";

  src = ./tmp;

  #buildInputs = [ ffmpeg (kde4.wrapper kde4.kdenlive) filezilla ];
  buildInputs = [ ffmpeg (kde4.wrapper kde4.kdenlive) filezilla ];

}
