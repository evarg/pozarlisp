;
; zmienne globalne
;

; definicja aktywnego systemu
(setq AKTYWNY_SYSTEM "BRAK")

; lista systemow
(setq SYSTEMY_LISTA '("BOSCHFPA5000" "EST3" "POLON4200" "POLON4900" "FP2000" "ESSER" 
                      "AWEX"
                     )
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
