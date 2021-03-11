; definicje logow systemowych
(setq LOG_SZEROKOSC 80)

; wyswietla linie na szerokosc i z gwiazdka z przodu i tylu
(defun pl:Log (tekst / wynik)
	(setq wynik (strcat "  * " tekst " "))
	(repeat (- LOG_SZEROKOSC (strlen wynik))
		(setq wynik (strcat wynik " "))
	)
	(setq wynik (strcat wynik " *  "))
	(print wynik)
)

; wyswietla linie na szerokosc z gwiazdek
(defun pl:LogLinia (/ wynik)
	(setq wynik "  ")
	(repeat LOG_SZEROKOSC
		(setq wynik (strcat wynik "*"))
	)
	(setq wynik (strcat wynik "  "))
	(print wynik)
)