; format atrybutu raw dla: ELEMENT
; 
; centrala;numer_na_petli;numer_seryjny;uuid
;

; format atrybutu raw dla: SYSTEM_POZAROWY
; 
; typ;uuid
;

(defun pl:UsunSS (/ ActiveSel) 
  (setq ActiveSel (cadr (ssgetfirst)))
  (if ActiveSel 
    (progn 
      (command "_erase" ActiveSel "")
    )
    (print "Nic nie wybrano")
  )
  (setq ActiveSel nil)
)

(defun pl:WstawElement (nazwaSystemu nazwaElementu / nazwaPliku) 
  (if (tblsearch "BLOCK" nazwaElementu) 
    (progn 
      (command "_insert" nazwaElementu "S" 1 "O" 0)
    )
    (progn 
      (setq nazwaPliku (strcat PATH_SYSTEMY nazwaSystemu "\\" nazwaElementu ".dwg"))
      (print (strcat "Wczytanie z dysku: " nazwaPliku))
      (command "_insert" nazwaPliku "S" 1 "O" 0 "")
      (print "koniec inster")
    )
  )
)


(defun pl:ElementWyrownajPoziom (/ blokPodstawowy blokDoPodmiany bazaX bazaY blokX 
                                 blokY
                                ) 
  (setq blokPodstawowy (car (entsel "Wybierz blok wzgledem ktorego ma byc pozycjonowanie" ) ))
  (setq bazaX (car (pl:BlokPozycjaGet blokPodstawowy)))
  (setq bazaY (cadr (pl:BlokPozycjaGet blokPodstawowy)))

  (while 1 
    (setq blokDoPodmiany (entsel "Wybierz blok ktory ma byc pozycjonowy"))
    (setq blokX (car (pl:BlokPozycjaGet (car blokDoPodmiany))))
    (setq blokY (cadr (pl:BlokPozycjaGet (car blokDoPodmiany))))

    (setq osval (getvar "OSMODE"))
    (setvar "OSMODE" 0)

    (command "._move" blokDoPodmiany "" (list blokX blokY) (list blokX bazaY))

    (setvar "OSMODE" osval)
  )
)
(defun pl:ElementWyrownajPion (/ blokPodstawowy blokDoPodmiany bazaX bazaY blokX 
                               blokY
                              ) 
  (setq blokPodstawowy (car (entsel "Wybierz blok wzgledem ktorego ma byc pozycjonowanie" ) ))
  (setq bazaX (car (pl:BlokPozycjaGet blokPodstawowy)))
  (setq bazaY (cadr (pl:BlokPozycjaGet blokPodstawowy)))

  (while 1 
    (setq blokDoPodmiany (entsel "Wybierz blok ktory ma byc pozycjonowy"))
    (setq blokX (car (pl:BlokPozycjaGet (car blokDoPodmiany))))
    (setq blokY (cadr (pl:BlokPozycjaGet (car blokDoPodmiany))))

    (setq osval (getvar "OSMODE"))
    (setvar "OSMODE" 0)

    (command "._move" 
             blokDoPodmiany
             ""
             (list blokX blokY)
             (list bazaX blokY)
    )
    (setvar "OSMODE" osval)
  )
)
(defun pl:ElementParujPionM (/ ActiveSel) 
  (setq ActiveSel (cadr (ssgetfirst)))
  (if (and ActiveSel (= (sslength ActiveSel) 2)) 
    (progn 
      (setq osval (getvar "OSMODE"))
      (setvar "OSMODE" 0)
      (command "._move" 
               (ssname ActiveSel 1)
               ""
               (pl:BlokPozycjaGet (ssname ActiveSel 1))
               (pl:BlokPozycjaGet (ssname ActiveSel 0))
      )
      (command "._move" 
               (ssname ActiveSel 1)
               ""
               "non"
               "0,0"
               "non"
               (list 0 KONF_OdstepParowaniaPion)
      )
      (setvar "OSMODE" osval)
    )
    (print "Nic nie wybrano albo wybrano za zle")
  )
)
(defun pl:ElementParujPoziomM (/ ActiveSel) 
  (setq ActiveSel (cadr (ssgetfirst)))
  (if (and ActiveSel (= (sslength ActiveSel) 2)) 
    (progn 
      (setq osval (getvar "OSMODE"))
      (setvar "OSMODE" 0)
      (command "._move" 
               (ssname ActiveSel 1)
               ""
               (pl:BlokPozycjaGet (ssname ActiveSel 1))
               (pl:BlokPozycjaGet (ssname ActiveSel 0))
      )
      (command "._move" 
               (ssname ActiveSel 1)
               ""
               "non"
               "0,0"
               "non"
               (list KONF_OdstepParowaniaPoziom 0)
      )
      (setvar "OSMODE" osval)
    )
    (print "Nic nie wybrano albo wybrano za zle")
  )
)
(defun pl:ElementWidocznoscAtrybutu (nazwaAtrybutu stan) 
  (setq ss1 (ssget "_X" '((0 . "INSERT"))))
  (setq l 0)

  (repeat (sslength ss1) 
    (setq blokS (ssname ss1 l))
    (setq blokNazwa (cdr (assoc 2 (entget blokS))))

    (if (pl:CzyElement blokNazwa) 
      (progn 
        (pl:AtrybutWidocznoscSet blokS nazwaAtrybutu stan)
      )
    )
    (setq l (+ l 1))
  )
)
(defun pl:CzyElement (nazwaBloku) 
  (setq iIloscBlokow (length LISTA_ELEMENTOW))
  (setq wynik nil)
  (setq i 0)
  (repeat iIloscBlokow 
    (setq ttt (strcat (nth i LISTA_ELEMENTOW) ""))
    (if (= ttt nazwaBloku) (setq wynik T))
    (setq i (+ i 1))
  )
  wynik
)