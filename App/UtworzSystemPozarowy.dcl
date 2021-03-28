dclUtworzSystemPozarowy : dialog { 
	  label = "Utworz system pozarowy";
 
	  : column {
    		label = "System pozarowy";
        : row {
          : button {
            label = "AWEX"; 
            key = "utworzSystemAwex";	
            alignment = centered; 
            width = 12;
          }
  
          : button {
            label = "BOSCH"; 
            key = "utworzSystemBosch";	
            alignment = centered; 
            width = 12;
          }

          : button {
            label = "ESSER"; 
            key = "utworzSystemEsser";	
            alignment = centered; 
            width = 12;
          }

          : button {
            label = "EST3"; 
            key = "utworzSystemEST3";	
            alignment = centered; 
            width = 12;
          }

          : button {
            label = "FP2000"; 
            key = "utworzSystemFP2000";	
            alignment = centered; 
            width = 12;
          }

          : button {
            label = "POLON4000"; 
            key = "utworzSystemPOLON4000";	
            alignment = centered; 
            width = 12;
          }
        }
    }

	: row {
		label = "Lista elementow";

		:edit_box {
			key = "listaElementow";
			value = "";
			edit_limit = 100;
			edit_width = 100;
		}
	}
 
	: row {
		label = "Lista elementow petlowych";

		:edit_box {
			key = "listaElementowPetlowych";
			value = "";
			edit_limit = 100;
			edit_width = 100;
		}
	}

	: row {
		label = "Nazwa systemu";

		:edit_box {
			key = "nazwaSystemu";
			value = "";
			edit_limit = 100;
			edit_width = 100;
		}
	}
  		
		:row{
 			: button {
				label = "Zapisz"; 
				key = "zapisz";	
				mnemonic = "O";
				alignment = centered; 
				width = 12;
				is_default = true;
			}
 			: button {
				label = "Anuluj"; 
				key = "anuluj";	
				mnemonic = "O";
				alignment = centered; 
				width = 12;
			}
		}
 
	}


}