;
; zmienne globalne
;

; definicja aktywnego systemu
(setq AKTYWNY_SYSTEM "BRAK")

(defun pl:UtworzCentrale () 
  (setq dcl_id (load_dialog (strcat PATH_SKRYPT "App\\UtworzCentrale.dcl")))

  (new_dialog "dclUtworzCentrale" dcl_id)

  (set_tile "lb1" "C")

  (action_tile "zapisz" 
               "
                (setq KONF_LISTA_ELEMENTOW (get_tile \"listaElementow\"))
                (setq KONF_LISTA_ELEMENTOW_PETLOWYCH (get_tile \"listaElementowPetlowych\"))
                (done_dialog 2)
                (command \"_insert\" nazwaPliku \"(0 0)\" 1 1 0 \"\" 0)

                (print (entlast))
                (pl:AtrybutWartoscSet (entlast) \"LISTA_ELEMENTOW\" KONF_LISTA_ELEMENTOW )
                (pl:AtrybutWartoscSet (entlast) \"LISTA_ELEMENTOW_PETLOWYCH\" KONF_LISTA_ELEMENTOW_PETLOWYCH )
			"
  )

  (action_tile "anuluj" 
               "
				(done_dialog 1)
			"
  )

  (start_dialog)
)


(defun pl:UtworzSystemPozarowy (/ nazwaPliku dcl_id nazwaSystemu) 
  (setq nazwaPliku (strcat PATH_SYSTEMY "\\SYSTEM_POZAROWY.dwg"))


  (setq dcl_id (load_dialog (strcat PATH_SKRYPT "App\\UtworzSystemPozarowy.dcl")))

  (new_dialog "dclUtworzSystemPozarowy" dcl_id)

  (action_tile "zapisz" 
               "
                (setq KONF_LISTA_ELEMENTOW (get_tile \"listaElementow\"))
                (setq KONF_LISTA_ELEMENTOW_PETLOWYCH (get_tile \"listaElementowPetlowych\"))
                (setq KONF_NAZWA_SYSTEMU (get_tile \"nazwaSystemu\"))
                (done_dialog 2)
                (command \"_insert\" nazwaPliku \"(0 0)\" 1 1 0 \"\" 0)

                (print (entlast))
                (pl:AtrybutWartoscSet (entlast) \"LISTA_ELEMENTOW\" KONF_LISTA_ELEMENTOW )
                (pl:AtrybutWartoscSet (entlast) \"LISTA_ELEMENTOW_PETLOWYCH\" KONF_LISTA_ELEMENTOW_PETLOWYCH )
                (pl:AtrybutWartoscSet (entlast) \"RAW\" (strcat KONF_NAZWA_SYSTEMU \";\" (pl:uuid)))

               "
  )

  (action_tile "anuluj" 
               "
				(done_dialog 1)
			"
  )

  (action_tile "utworzSystemAwex" 
               "
               (set_tile \"listaElementow\" (pl:list2string LISTA_ELEMENTOW_AWEX \";\"))
               (set_tile \"listaElementowPetlowych\" (pl:list2string LISTA_ELEMENTOW_PETLOWYCH_AWEX \";\"))
               (set_tile \"nazwaSystemu\" \"AWEX\")
 			"
  )

  (action_tile "utworzSystemBosch" 
               "
               (set_tile \"listaElementow\" (pl:list2string LISTA_ELEMENTOW_BOSCH \";\"))
               (set_tile \"listaElementowPetlowych\" (pl:list2string LISTA_ELEMENTOW_PETLOWYCH_BOSCH \";\"))
               (set_tile \"nazwaSystemu\" \"BOSCH\")
 			"
  )

  (action_tile "utworzSystemEsser" 
               "
               (set_tile \"listaElementow\" (pl:list2string LISTA_ELEMENTOW_ESSER \";\"))
               (set_tile \"listaElementowPetlowych\" (pl:list2string LISTA_ELEMENTOW_PETLOWYCH_ESSER \";\"))
               (set_tile \"nazwaSystemu\" \"ESSER\")
 			"
  )
  (action_tile "utworzSystemEST3" 
               "
               (set_tile \"listaElementow\" (pl:list2string LISTA_ELEMENTOW_EST3 \";\"))
               (set_tile \"listaElementowPetlowych\" (pl:list2string LISTA_ELEMENTOW_PETLOWYCH_EST3 \";\"))
               (set_tile \"nazwaSystemu\" \"EST3\")
 			"
  )

  (action_tile "utworzSystemFP2000" 
               "
               (set_tile \"listaElementow\" (pl:list2string LISTA_ELEMENTOW_FP2000 \";\"))
               (set_tile \"listaElementowPetlowych\" (pl:list2string LISTA_ELEMENTOW_PETLOWYCH_FP2000 \";\"))
               (set_tile \"nazwaSystemu\" \"FP2000\")
 			"
  )

  (action_tile "utworzSystemPOLON4000" 
               "
               (set_tile \"listaElementow\" (pl:list2string LISTA_ELEMENTOW_POLON4000 \";\"))
               (set_tile \"listaElementowPetlowych\" (pl:list2string LISTA_ELEMENTOW_PETLOWYCH_POLON4000 \";\"))
               (set_tile \"nazwaSystemu\" \"POLON4000\")
 			"
  )


  (start_dialog)
  (unload_dialog dcl_id)
)



(setq ESSER_PATH_BLOKI (strcat PATH_SKRYPT "Systemy\\ESSER\\"))

(setq LISTA_BLOKOW '("ESSER_12R" "ESSER_4G2R" "ESSER_FCT" "ESSER_MCP" "ESSER_O" 
                     "ESSER_O2T" "ESSER_O2TW" "ESSER_OT" "ESSER_TAL" "ESSER_TD" 
                     "ESSER_Wireless" "ESSER_WZ"
                    )
)

(defun pl:ListaBlokow (/ iloscBlokow ttt i) 
  (pl:LogLinia)
  (setq iloscBlokow (length LISTA_BLOKOW))
  (setq i 0)
  (repeat iloscBlokow 
    (setq ttt (strcat (nth i LISTA_BLOKOW) ""))
    (pl:Log ttt)
    (setq i (+ i 1))
  )
  (pl:LogLinia)
  (pl:Log (strcat "Znalezionych bloków: " (itoa iloscBlokow)))
  (pl:LogLinia)
  (print)
)	
	
(defun pl:BlokiWczytajZDysku () 
  (ssp:BlokiWczytajZDysku ESSER_LISTA_BLOKOW ESSER_PATH_BLOKI)
)	
	
(defun pl:ParametrOn (sNazwa) 
  (ssp:ParametrListaOn ESSER_LISTA_BLOKOW sNazwa)
)	
	
(defun pl:ParametrOff (sNazwa) 
  (ssp:ParametrListaOff ESSER_LISTA_BLOKOW sNazwa)
)	
	
(defun pl:PobierzListeElementow () 
  (ssp:PobierzListeElementow ESSER_LISTA_BLOKOW)
)	
