dclAbout : dialog { 
	  label = "About";
    width = 100;

    : text {
	    key = "txt1";
	    value = "PozarLisp";
	  }

    : text {
	    key = "txt2";
	    value = "Aplikacja pozwalajaca ulatwic prace podczas projektowania i uruchamiania systemow p.poz.";
	  }

    : text {
	    key = "txt3";
	    value = "Autor: Bartosz Grabski bartoszagrabski@gmail.com";
	  }

 		: button {
				label = "Zamknij"; 
				key = "ok";	
				mnemonic = "O";
				alignment = centered; 
				width = 12;
				is_default = true;
		}
}