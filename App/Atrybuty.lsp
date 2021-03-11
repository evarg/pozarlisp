; stale dt justowania
(defconstant J_LEFT 0)
(defconstant J_CENTER 1)
(defconstant J_RIGHT 2)
(defconstant J_UP 3)
(defconstant J_MIDDLE 2)
(defconstant J_DOWN 1)

; załozenie dla bloku 400x400 z punktem wstawienia w srodku
(setq odstepXL 220)
(setq odstepYU 220)
(setq odstepXR -220)
(setq odstepYD -220)

(setq AtrybutDoPozycjonowaniaNazwa "centrala")




(defun pl:AtrybutPozycjonowanieM (miejsce) 
  (setq ActiveSel (cadr (ssgetfirst)))
  (setq l 0)
  (if ActiveSel 
    (progn 
      (repeat (sslength ActiveSel) 
        (setq blok (ssname ActiveSel l))
        (setq skalaBloku (pl:BlokSkalaGet blok))

        (if (= miejsce "UL") 
          (progn 
            (pl:AtrybutJustifyHorizontalSet blok AtrybutDoPozycjonowaniaNazwa J_RIGHT)
            (pl:AtrybutJustifyVerticalSet blok AtrybutDoPozycjonowaniaNazwa J_DOWN)
            (pl:AtrybutPozycjaSet 
              blok
              AtrybutDoPozycjonowaniaNazwa
              (* skalaBloku odstepXR)
              (* skalaBloku odstepYU)
            )
          )
        )

        (if (= miejsce "UC") 
          (progn 
            (pl:AtrybutJustifyHorizontalSet blok AtrybutDoPozycjonowaniaNazwa J_CENTER)
            (pl:AtrybutJustifyVerticalSet blok AtrybutDoPozycjonowaniaNazwa J_DOWN)
            (pl:AtrybutPozycjaSet 
              blok
              AtrybutDoPozycjonowaniaNazwa
              0
              (* skalaBloku odstepYU)
            )
          )
        )

        (if (= miejsce "UR") 
          (progn 
            (pl:AtrybutJustifyHorizontalSet blok AtrybutDoPozycjonowaniaNazwa J_LEFT)
            (pl:AtrybutJustifyVerticalSet blok AtrybutDoPozycjonowaniaNazwa J_DOWN)
            (pl:AtrybutPozycjaSet 
              blok
              AtrybutDoPozycjonowaniaNazwa
              (* skalaBloku odstepXL)
              (* skalaBloku odstepYU)
            )
          )
        )

        (if (= miejsce "ML") 
          (progn 
            (pl:AtrybutJustifyHorizontalSet blok AtrybutDoPozycjonowaniaNazwa J_RIGHT)
            (pl:AtrybutJustifyVerticalSet blok AtrybutDoPozycjonowaniaNazwa J_MIDDLE)
            (pl:AtrybutPozycjaSet 
              blok
              AtrybutDoPozycjonowaniaNazwa
              (* skalaBloku odstepXR)
              0
            )
          )
        )

        (if (= miejsce "MC") 
          (progn 
            (pl:AtrybutJustifyHorizontalSet blok AtrybutDoPozycjonowaniaNazwa J_CENTER)
            (pl:AtrybutJustifyVerticalSet blok AtrybutDoPozycjonowaniaNazwa J_MIDDLE)
            (pl:AtrybutPozycjaSet blok AtrybutDoPozycjonowaniaNazwa 0 0)
          )
        )

        (if (= miejsce "MR") 
          (progn 
            (pl:AtrybutJustifyHorizontalSet blok AtrybutDoPozycjonowaniaNazwa J_LEFT)
            (pl:AtrybutJustifyVerticalSet blok AtrybutDoPozycjonowaniaNazwa J_MIDDLE)
            (pl:AtrybutPozycjaSet 
              blok
              AtrybutDoPozycjonowaniaNazwa
              (* skalaBloku odstepXL)
              0
            )
          )
        )

        (if (= miejsce "DL") 
          (progn 
            (pl:AtrybutJustifyHorizontalSet blok AtrybutDoPozycjonowaniaNazwa J_RIGHT)
            (pl:AtrybutJustifyVerticalSet blok AtrybutDoPozycjonowaniaNazwa J_UP)
            (pl:AtrybutPozycjaSet 
              blok
              AtrybutDoPozycjonowaniaNazwa
              (* skalaBloku odstepXR)
              (* skalaBloku odstepYD)
            )
          )
        )

        (if (= miejsce "DC") 
          (progn 
            (pl:AtrybutJustifyHorizontalSet blok AtrybutDoPozycjonowaniaNazwa J_CENTER)
            (pl:AtrybutJustifyVerticalSet blok AtrybutDoPozycjonowaniaNazwa J_UP)
            (pl:AtrybutPozycjaSet 
              blok
              AtrybutDoPozycjonowaniaNazwa
              0
              (* skalaBloku odstepYD)
            )
          )
        )

        (if (= miejsce "DR") 
          (progn 
            (pl:AtrybutJustifyHorizontalSet blok AtrybutDoPozycjonowaniaNazwa J_LEFT)
            (pl:AtrybutJustifyVerticalSet blok AtrybutDoPozycjonowaniaNazwa J_UP)
            (pl:AtrybutPozycjaSet 
              blok
              AtrybutDoPozycjonowaniaNazwa
              (* skalaBloku odstepXL)
              (* skalaBloku odstepYD)
            )
          )
        )

        (setq l (+ l 1))
      )
    )
    (print "Nic nie wybrano")
  )
)




(defun pl:AtrybutPozycjonowanie () 
  (setq dcl_id (load_dialog (strcat PATH_SKRYPT "App\\AtrybutPozycjonowanie.dcl")))
  (print dcl_id)

  (setq nastepny 1)

  (while (not (>= 0 nastepny)) 
    (setq blok (entsel))
    (setq skalaBloku (pl:BlokSkalaGet (car blok)))

    (new_dialog "dclAtrybutPozycjonowanie" dcl_id)

    (set_tile "AtrybutDoPozycjonowaniaNazwa" AtrybutDoPozycjonowaniaNazwa)

    (action_tile "wn" 
                 "
				(setq nastepny 1)
				(done_dialog 2)
			"
    )

    (action_tile "ko" 
                 "
				(setq nastepny 0)
				(done_dialog 1)
			"
    )

    (action_tile "ul" 
                 "
				(pl:AtrybutJustifyHorizontalSet (car blok) nazwaParametru J_RIGHT)
				(pl:AtrybutJustifyVerticalSet (car blok) nazwaParametru J_DOWN)
				(pl:AtrybutPozycjaSet (car blok) nazwaParametru (* skalaBloku odstepXR) (* skalaBloku odstepYU))
 			"
    )

    (action_tile "uc" 
                 "
				(pl:AtrybutJustifyHorizontalSet (car blok) nazwaParametru J_CENTER)
				(pl:AtrybutJustifyVerticalSet (car blok) nazwaParametru J_DOWN)
				(pl:AtrybutPozycjaSet (car blok) nazwaParametru 0 (* skalaBloku odstepYU))
			"
    )

    (action_tile "ur" 
                 "
				(pl:AtrybutJustifyHorizontalSet (car blok) nazwaParametru J_LEFT)
				(pl:AtrybutJustifyVerticalSet (car blok) nazwaParametru J_DOWN)
				(pl:AtrybutPozycjaSet (car blok) nazwaParametru (* skalaBloku odstepXL) (* skalaBloku odstepYU))
		"
    )

    (action_tile "ml" 
                 "
				(pl:AtrybutJustifyHorizontalSet (car blok) nazwaParametru J_RIGHT)
				(pl:AtrybutJustifyVerticalSet (car blok) nazwaParametru J_MIDDLE)
				(pl:AtrybutPozycjaSet (car blok) nazwaParametru (* skalaBloku odstepXR) 0)
							"
    )

    (action_tile "mc" 
                 "
				(pl:AtrybutJustifyHorizontalSet (car blok) nazwaParametru J_CENTER)
				(pl:AtrybutJustifyVerticalSet (car blok) nazwaParametru J_MIDDLE)
				(pl:AtrybutPozycjaSet (car blok) nazwaParametru 0 0)
			"
    )

    (action_tile "mr" 
                 "
				(pl:AtrybutJustifyHorizontalSet (car blok) nazwaParametru J_LEFT)
				(pl:AtrybutJustifyVerticalSet (car blok) nazwaParametru J_MIDDLE)
				(pl:AtrybutPozycjaSet (car blok) nazwaParametru (* skalaBloku odstepXL) 0)
			"
    )

    (action_tile "dl" 
                 "
				(pl:AtrybutJustifyHorizontalSet (car blok) nazwaParametru J_RIGHT)
				(pl:AtrybutJustifyVerticalSet (car blok) nazwaParametru J_UP)
				(pl:AtrybutPozycjaSet (car blok) nazwaParametru (* skalaBloku odstepXR) (* skalaBloku odstepYD))
			"
    )

    (action_tile "dc" 
                 "
				(pl:AtrybutJustifyHorizontalSet (car blok) nazwaParametru J_CENTER)
				(pl:AtrybutJustifyVerticalSet (car blok) nazwaParametru J_UP)
				(pl:AtrybutPozycjaSet (car blok) nazwaParametru 0 (* skalaBloku odstepYD))
			"
    )

    (action_tile "dr" 
                 "
				(pl:AtrybutJustifyHorizontalSet (car blok) nazwaParametru J_LEFT)
				(pl:AtrybutJustifyVerticalSet (car blok) nazwaParametru J_UP)
				(pl:AtrybutPozycjaSet (car blok) nazwaParametru (* skalaBloku odstepXL) (* skalaBloku odstepYD))
			"
    )

    (action_tile "zmienNazwe" 
                 "
				(setq AtrybutDoPozycjonowaniaNazwa (get_tile \"AtrybutDoPozycjonowaniaNazwa\"))
			"
    )

    (start_dialog)
  )
  (unload_dialog dcl_id)
)

;
; entityName - musi byc: (car (entsel))
;
(defun pl:AtrybutJustifyHorizontalSet (entityName nazwaAtrybutu wartosc) 
  (pl:AtrybutParametrSet entityName nazwaAtrybutu 72 wartosc)
);defun

;
; entityName - musi byc: (car (entsel))
;
(defun pl:AtrybutJustifyVerticalSet (entityName nazwaAtrybutu wartosc) 
  (pl:AtrybutParametrSet entityName nazwaAtrybutu 74 wartosc)
);defun

;
; entityName - musi byc: (car (entsel))
;
(defun pl:AtrybutParametrSet (entityName nazwaAtrybutu numerParametru wartosc / enx) 
  (while 
    (and 
      (null end)
      (= "ATTRIB" 
         (cdr (assoc 0 (setq enx (entget (setq entityName (entnext entityName))))))
      )
    ) ;and

    (if (= (strcase nazwaAtrybutu) (strcase (cdr (assoc 2 enx)))) 
      (setq entityDXFpopr (subst (cons numerParametru wartosc) 
                                 (assoc numerParametru enx)
                                 enx
                          )
      )
    ) ;if
  ) ;while
  (entmod entityDXFpopr)
);defun

(defun pl:AtrybutWartoscSet (entityName nazwaAtrybutu wartosc / enx) 
  (pl:AtrybutParametrSet entityName nazwaAtrybutu 1 wartosc)
)


;
; entityName - musi byc: (car (entsel))
;
(defun pl:AtrybutPozycjaSet (entityName nazwaAtrybutu roznicaX roznicaY) 
  (setq blokNazwa entityName)
  (setq pozycjaBloku (pl:BlokPozycjaGet entityName))

  (while 
    (and 
      (null end)
      (= "ATTRIB" 
         (cdr (assoc 0 (setq enx (entget (setq entityName (entnext entityName))))))
      )
    ) ;and

    (if (= (strcase nazwaAtrybutu) (strcase (cdr (assoc 2 enx)))) 
      (setq pozycjaAtrybutu (assoc 11 enx))
      (setq atrybut enx)
    ) ;if
  ) ;while

  (setq pozycjaBlokuX (nth 0 pozycjaBloku))
  (setq pozycjaBlokuY (nth 1 pozycjaBloku))

  (pl:AtrybutParametrSet 
    blokNazwa
    nazwaAtrybutu
    11
    (list (+ pozycjaBlokuX roznicaX) (+ pozycjaBlokuY roznicaY))
  )
);defun

(defun pl:AtrybutWartoscGet (entityName nazwaAtrybutu) 
  (while 
    (and 
      (null end)
      (= "ATTRIB" 
         (cdr (assoc 0 (setq enx (entget (setq entityName (entnext entityName))))))
      )
    ) ;and

    (if (= (strcase nazwaAtrybutu) (strcase (cdr (assoc 2 enx)))) 
      (setq wynik (cdr (assoc 1 enx)))
    ) ;if
  ) ;while
  wynik
)