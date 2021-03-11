dclAtrybutPozycjonowanie : dialog { 
	label = "Pozycjonowanie atrubutu";
 
	: row {
		label = "Nazwa parametru";

		:edit_box {
			key = "AtrybutDoPozycjonowaniaNazwa";
			label = "Nazwa parametru";
			value = "";
			mnemonic = "D";
			edit_limit = 10;
			edit_width = 10;
		}
		: button {
			label = "Zmien"; 
			key = "zmienNazwe";	
			alignment = centered; 
			width = 12;
			is_default = true;
		}
	}
 
	: column {
 		: row {
 			: button {
				label = "U-L"; 
				key = "ul";	
				mnemonic = "O";
				alignment = centered; 
				width = 12;
				is_default = true;
			}
 			: button {
				label = "U-C"; 
				key = "uc";	
				mnemonic = "O";
				alignment = centered; 
				width = 12;
				is_default = true;
			}
 			: button {
				label = "U-R"; 
				key = "ur";	
				mnemonic = "O";
				alignment = centered; 
				width = 12;
				is_default = true;
			}
		}
 
		: row {
 			: button {
				label = "M-L"; 
				key = "ml";	
				mnemonic = "O";
				alignment = centered; 
				width = 12;
				is_default = true;
			}
 			: button {
				label = "M-C"; 
				key = "mc";	
				mnemonic = "O";
				alignment = centered; 
				width = 12;
				is_default = true;
			}
 			: button {
				label = "M-R"; 
				key = "mr";	
				mnemonic = "O";
				alignment = centered; 
				width = 12;
				is_default = true;
			}
		}
 
		: row {
 			: button {
				label = "D-L"; 
				key = "dl";	
				mnemonic = "O";
				alignment = centered; 
				width = 12;
				is_default = true;
			}
 			: button {
				label = "D-C"; 
				key = "dc";	
				mnemonic = "O";
				alignment = centered; 
				width = 12;
				is_default = true;
			}
 			: button {
				label = "D-R"; 
				key = "dr";	
				mnemonic = "O";
				alignment = centered; 
				width = 12;
				is_default = true;
			}
		}
		
		:row{
 			: button {
				label = "Wybierz nastepny"; 
				key = "wn";	
				mnemonic = "O";
				alignment = centered; 
				width = 12;
				is_default = true;
			}
 			: button {
				label = "Koniec"; 
				key = "ko";	
				mnemonic = "O";
				alignment = centered; 
				width = 12;
				is_default = true;
			}
		}
 
	}


}