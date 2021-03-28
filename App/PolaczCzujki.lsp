(defun pl:Random (/ a c m) 
  (setq m   4294967296.0
        a   1664525.0
        c   1013904223.0
        $xn (rem (+ c (* a (cond ($xn) ((getvar 'date))))) m)
  )
  (/ $xn m)
)

(defun pl:uuid (/ auuid) 
  (setq aauid (substr (rtos (pl:Random) 2 6) 3 4))
  (setq aauid (strcat aauid "-" (substr (rtos (pl:Random) 2 6) 3 6)))
  (setq aauid (strcat aauid "-" (substr (rtos (pl:Random) 2 6) 3 4)))
  aauid
)

(defun pl:Polylinia2 (x1 y1 x4 y4) 
  (setq p1 (list x1 y1))
  (setq p4 (list x2 y2))

  (setq x2 (+ x1 (/ (- x4 x1) 2)))
  (setq y2 y1)
  (setq x3 x2)
  (setq y3 (cadr p4))

  (setq p2 (list x2 y2))
  (setq p3 (list x3 y3))

  (command "_pline" p1 p2 p3 p4 "")
)

(defun pl:PolaczCzujki () 
  (setq dcl_id (load_dialog (strcat PATH_SKRYPT "App\\PolaczCzujki.dcl")))
  (print "Wybierz czujke lewa")
  (setq czujka1 (car (entsel)))
  (print "Wybierz czujke lewa")
  (setq czujka2 (car (entsel)))

  ;  (print (pl:BlokPozycjaGet czujka1))
  (setq x1 (car (pl:BlokPozycjaGet czujka1)))
  (setq y1 (cadr (pl:BlokPozycjaGet czujka1)))

  (setq x2 (car (pl:BlokPozycjaGet czujka2)))
  (setq y2 (cadr (pl:BlokPozycjaGet czujka2)))

  (print (pl:BlokPozycjaGet czujka1))
  (print x1)
  (print y1)

  (print (pl:BlokPozycjaGet czujka2))
  (print x2)
  (print y2)


  (pl:Polylinia2 x1 y1 x2 y2)

  (new_dialog "dclPolaczCzujki" dcl_id)
  ;    (new_dialog "samp5" dcl_id)

  (action_tile 
    "cancel"
    "(done_dialog) (setq userclick nil)"
  )

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