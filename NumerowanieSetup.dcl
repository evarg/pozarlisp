NumerowanieSetup : dialog {
	label = "Ustawienia inkrementacji" ;
	fixed_width = true ;
	fixed_height = true;
	width = 50;
	height = 20;
	
	:column{
		width = 40;
		fixed_width = true;
		fixed_height = true;
		: boxed_column {
			label = "Maska inkrementacji";
			fixed_width = false;
			: edit_box {
				key = "dclMaska" ;
				width = 5 ;
				edit_width = 40 ;
				edit_limit = 40 ;
				fixed_width = true;
			}
			: text {
				label = "W miejscie liczby inkrementowanej nalezy wstawic ##";
			}
		}
		
		: row {
			fixed_width = false;
			: boxed_row {
				label = "Parametry inkrementacji";
				fixed_width = false ;
				
				: column {
					fixed_width = true;
					children_alignment = centered;
					width = 15;
					: text {
						fixed_width = true;
						width = 10;
						label ="Startuj od:";
					}
					: edit_box {
						key = "dclStartOd" ;
						width = 10 ;
						edit_width = 10 ;
						edit_limit = 5 ;
						fixed_width = true;
					}
				}

				: column {
					fixed_width = true ;
					children_alignment = centered;
					width = 15;
					: text {
						fixed_width = true;
						width = 10;
						label ="Krok co:";
					}
					: edit_box {
						key = "dclKrok" ;
						width = 10 ;
						edit_width = 10 ;
						edit_limit = 5 ;
						fixed_width = true;
					}
				}

				: column {
					fixed_width = true ;
					children_alignment = centered;
					width = 15;
					: text {
						fixed_width = true ;
						width = 10;
						label ="Cyfr:";
						alignment = centered;
					}
					: edit_box {
						key = "dclLiczbaCyfr" ;
						width = 10 ;
						edit_width = 10 ;
						edit_limit = 5 ;
						fixed_width = true;
					}
				}
			}
		}
		: column {
			fixed_width = false;
			fixed_height = false;
			
			: boxed_row {
				label = "Dotyczy atrybutu";
				: column {
					fixed_width = true ;
					children_alignment = centered;
					width = 15;
					: text {
						fixed_width = true;
						width = 10;
						label ="Nazwa:";
					}
					: edit_box {
						key = "dclAtrybut" ;
						width = 10 ;
						edit_width = 10 ;
						edit_limit = 5 ;
						fixed_width = true;
					}
				}
			}
		}
		: row {
			fixed_width = false;
			fixed_height = false;
			
			spacer_0;
			
			: button {
				key = "numeruj" ;
				label = "Numeruj" ;
				fixed_width = true ;
				alignment = centered ;
			}	
			: button {
				key = "zapisz" ;
				label = "Zapisz" ;
				fixed_width = true ;
				alignment = centered ;
			}	
			: button {
				key = "anuluj" ;
				label = "Anuluj" ;
				fixed_width = true ;
				alignment = centered ;
			}	
			
			spacer_0;
			
		}
	}
}
