; stale dt justowania
(defconstant J_LEFT 0)
(defconstant J_CENTER 1)
(defconstant J_RIGHT 2)
(defconstant J_UP 3)
(defconstant J_MIDDLE 2)
(defconstant J_DOWN 1)

; załozenie dla bloku 400x400 z punktem wstawienia w srodku
(setq KONF_AtrybutPozycjaL -230)
(setq KONF_AtrybutPozycjaR 220)
(setq KONF_AtrybutPozycjaU 170)
(setq KONF_AtrybutPozycjaD -240)
(setq KONF_AtrybutKorektaWZ -100)

(setq KONF_AtrybutDefault "centrala")

(setq KONF_OdstepParowaniaPion -500)
(setq KONF_OdstepParowaniaPoziom 500)

; sciezka dostepu do blokow dla systemow
(setq PATH_SYSTEMY "d:\\pozarlisp\\Systemy\\")

; liczba dostepnych parametrow w atrybucie raw
(setq KONF_RAW_ROZMIAR 4)
(setq KONF_RAW_CENTRALA 0)
(setq KONF_RAW_NR_NA_PETLI 1)
(setq KONF_RAW_SERIAL 2)
(setq KONF_RAW_UUID 3)

; lista systemow
(setq KONF_LISTA_ELEMENTOW '())
(setq KONF_LISTA_ELEMENTOW_PETLOWYCH '())
