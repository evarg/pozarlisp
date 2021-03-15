(defun pl:AtrybutSetup () 
  (setq dcl_id (load_dialog (strcat PATH_SKRYPT "App\\AtrybutSetup.dcl")))
  (print dcl_id)

  (new_dialog "dclAtrybutSetup" dcl_id)

  (set_tile "atrybutPozycjaL" KONF_AtrybutPozycjaL)
  (set_tile "atrybutPozycjaR" KONF_AtrybutPozycjaR)
  (set_tile "atrybutPozycjaU" KONF_AtrybutPozycjaU)
  (set_tile "atrybutPozycjaD" KONF_AtrybutPozycjaD)
  (set_tile "atrybutDefault" KONF_AtrybutDefault)

  (action_tile "zapisz" 
               "
               (setq KONF_AtrybutPozycjaL (atoi (get_tile \"atrybutPozycjaL\")))
               (setq KONF_AtrybutPozycjaR (atoi (get_tile \"atrybutPozycjaR\")))
               (setq KONF_AtrybutPozycjaU (atoi (get_tile \"atrybutPozycjaU\")))
               (setq KONF_AtrybutPozycjaD (atoi (get_tile \"atrybutPozycjaD\")))
               (setq KONF_AtrybutDefault (get_tile \"atrybutDefault\"))
				       (done_dialog 2)
			"
  )

  (action_tile "anuluj" 
               "
				(done_dialog 1)
			"
  )

  (action_tile "centralaOn" 
               "
                (pl:ElementWidocznoscAtrybutu \"CENTRALA\" \"ON\") 
               "
  )


  (action_tile "centralaOff" 
               "
                (pl:ElementWidocznoscAtrybutu \"CENTRALA\" \"OFF\") 
               "
  )

  (action_tile "planOn" 
               "
                (pl:ElementWidocznoscAtrybutu \"PLAN\" \"ON\")
               "
  )


  (action_tile "planOff" 
               "
                (pl:ElementWidocznoscAtrybutu \"PLAN\" \"OFF\") 
               "
  )

  (action_tile "rawOn" 
               "
                (pl:ElementWidocznoscAtrybutu \"RAW\" \"ON\") 
               "
  )


  (action_tile "rawOff" 
               "
                (pl:ElementWidocznoscAtrybutu \"RAW\" \"OFF\") 
               "
  )

  (start_dialog)
  (unload_dialog dcl_id)
)


;
; pozycjonowanie atrybutu 
; miejsce: UL UC UR ML MC MR DL DC DR MLW
;
(defun pl:AtrybutPozycja (entityName atrybutNazwa miejsce skalaBloku) 
  (setq skalaBloku (pl:BlokSkalaGet entityName))

  (if (= miejsce "UL") 
    (progn 
      (pl:AtrybutJustifyHorizontalSet entityName atrybutNazwa J_RIGHT)
      (pl:AtrybutJustifyVerticalSet entityName atrybutNazwa J_DOWN)
      (pl:AtrybutPozycjaSet 
        entityName
        atrybutNazwa
        (* skalaBloku KONF_AtrybutPozycjaL)
        (* skalaBloku KONF_AtrybutPozycjaU)
      )
    )
  )

  (if (= miejsce "UC") 
    (progn 
      (pl:AtrybutJustifyHorizontalSet entityName atrybutNazwa J_CENTER)
      (pl:AtrybutJustifyVerticalSet entityName atrybutNazwa J_DOWN)
      (pl:AtrybutPozycjaSet 
        entityName
        atrybutNazwa
        0
        (* skalaBloku KONF_AtrybutPozycjaU)
      )
    )
  )

  (if (= miejsce "UR") 
    (progn 
      (pl:AtrybutJustifyHorizontalSet entityName atrybutNazwa J_LEFT)
      (pl:AtrybutJustifyVerticalSet entityName atrybutNazwa J_DOWN)
      (pl:AtrybutPozycjaSet 
        entityName
        atrybutNazwa
        (* skalaBloku KONF_AtrybutPozycjaR)
        (* skalaBloku KONF_AtrybutPozycjaU)
      )
    )
  )

  (if (= miejsce "ML") 
    (progn 
      (pl:AtrybutJustifyHorizontalSet entityName atrybutNazwa J_RIGHT)
      (pl:AtrybutJustifyVerticalSet entityName atrybutNazwa J_MIDDLE)
      (pl:AtrybutPozycjaSet 
        entityName
        atrybutNazwa
        (* skalaBloku KONF_AtrybutPozycjaL)
        0
      )
    )
  )

  (if (= miejsce "MLW") 
    (progn 
      (pl:AtrybutJustifyHorizontalSet entityName atrybutNazwa J_RIGHT)
      (pl:AtrybutJustifyVerticalSet entityName atrybutNazwa J_MIDDLE)
      (pl:AtrybutPozycjaSet 
        entityName
        atrybutNazwa
        (* skalaBloku (+ KONF_AtrybutPozycjaL KONF_AtrybutKorektaWZ))
        0
      )
    )
  )

  (if (= miejsce "MC") 
    (progn 
      (pl:AtrybutJustifyHorizontalSet entityName atrybutNazwa J_CENTER)
      (pl:AtrybutJustifyVerticalSet entityName atrybutNazwa J_MIDDLE)
      (pl:AtrybutPozycjaSet entityName atrybutNazwa 0 0)
    )
  )

  (if (= miejsce "MR") 
    (progn 
      (pl:AtrybutJustifyHorizontalSet entityName atrybutNazwa J_LEFT)
      (pl:AtrybutJustifyVerticalSet entityName atrybutNazwa J_MIDDLE)
      (pl:AtrybutPozycjaSet 
        entityName
        atrybutNazwa
        (* skalaBloku KONF_AtrybutPozycjaR)
        0
      )
    )
  )

  (if (= miejsce "DL") 
    (progn 
      (pl:AtrybutJustifyHorizontalSet entityName atrybutNazwa J_RIGHT)
      (pl:AtrybutJustifyVerticalSet entityName atrybutNazwa J_UP)
      (pl:AtrybutPozycjaSet 
        entityName
        atrybutNazwa
        (* skalaBloku KONF_AtrybutPozycjaL)
        (* skalaBloku KONF_AtrybutPozycjaD)
      )
    )
  )

  (if (= miejsce "DC") 
    (progn 
      (pl:AtrybutJustifyHorizontalSet entityName atrybutNazwa J_CENTER)
      (pl:AtrybutJustifyVerticalSet entityName atrybutNazwa J_UP)
      (pl:AtrybutPozycjaSet 
        entityName
        atrybutNazwa
        0
        (* skalaBloku KONF_AtrybutPozycjaD)
      )
    )
  )

  (if (= miejsce "DR") 
    (progn 
      (pl:AtrybutJustifyHorizontalSet entityName atrybutNazwa J_LEFT)
      (pl:AtrybutJustifyVerticalSet entityName atrybutNazwa J_UP)
      (pl:AtrybutPozycjaSet 
        entityName
        atrybutNazwa
        (* skalaBloku KONF_AtrybutPozycjaR)
        (* skalaBloku KONF_AtrybutPozycjaD)
      )
    )
  )
)


(defun pl:AtrybutPozycjonowanieM (miejsce / blok skalaBloku ActiveSel l) 
  (setq ActiveSel (cadr (ssgetfirst)))
  (setq l 0)
  (if ActiveSel 
    (progn 
      (repeat (sslength ActiveSel) 
        (setq blok (ssname ActiveSel l))
        (print blok)
        (print (pl:CzyElement blok))
        (if (pl:CzyElement (cdr (assoc 2 (entget blok)))) 
          (progn 
            (setq skalaBloku (pl:BlokSkalaGet blok))
            (pl:AtrybutPozycja 
              blok
              KONF_AtrybutDefault
              miejsce
              skalaBloku
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
    (setq blokName (car (entsel)))
    (setq skalaBloku (pl:BlokSkalaGet blokName))

    (print blokName)
    (new_dialog "dclAtrybutPozycjonowanie" dcl_id)

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
				(pl:AtrybutPozycja blokName KONF_AtrybutDefault \"UL\" skalaBloku)
 			"
    )

    (action_tile "uc" 
                 "
				(pl:AtrybutPozycja blokName KONF_AtrybutDefault \"UC\" skalaBloku)
			"
    )

    (action_tile "ur" 
                 "
				(pl:AtrybutPozycja blokName KONF_AtrybutDefault \"UR\" skalaBloku)
		"
    )

    (action_tile "ml" 
                 "
				(pl:AtrybutPozycja blokName KONF_AtrybutDefault \"ML\" skalaBloku)
							"
    )

    (action_tile "mc" 
                 "
				(pl:AtrybutPozycja blokName KONF_AtrybutDefault \"MC\" skalaBloku)
			"
    )

    (action_tile "mr" 
                 "
				(pl:AtrybutPozycja blokName KONF_AtrybutDefault \"MR\" skalaBloku)
			"
    )

    (action_tile "dl" 
                 "
				(pl:AtrybutPozycja blokName KONF_AtrybutDefault \"DL\" skalaBloku)
			"
    )

    (action_tile "dc" 
                 "
				(pl:AtrybutPozycja blokName KONF_AtrybutDefault \"DC\" skalaBloku)
			"
    )

    (action_tile "dr" 
                 "
				(pl:AtrybutPozycja blokName KONF_AtrybutDefault \"DR\" skalaBloku)
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
(defun pl:AtrybutParametrSet (entityName nazwaAtrybutu numerParametru wartosc / enx 
                              entityDXFpopr
                             ) 
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


(defun pl:AtrybutWartoscSet (entityName nazwaAtrybutu wartosc) 
  (pl:AtrybutParametrSet entityName nazwaAtrybutu 1 wartosc)
)

;
; entityName - musi byc: (car (entsel))
;
(defun pl:AtrybutPozycjaSet (entityName nazwaAtrybutu roznicaX roznicaY / enx 
                             pozycjaBloku
                            ) 
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
    ) ;if
  ) ;while

  (setq pozycjaBlokuX (nth 0 pozycjaBloku))
  (setq pozycjaBlokuY (nth 1 pozycjaBloku))

  (pl:AtrybutParametrSet 
    entityName
    nazwaAtrybutu
    11
    (list (+ pozycjaBlokuX roznicaX) (+ pozycjaBlokuY roznicaY))
  )
);defun


(defun pl:AtrybutWidocznoscSet (entityName nazwaAtrybutu stan) 
  (if (= stan "ON") 
    (pl:AtrybutParametrSet entityName nazwaAtrybutu 70 0)
  )
  (if (= stan "OFF") 
    (pl:AtrybutParametrSet entityName nazwaAtrybutu 70 1)
  )
)


(defun pl:AtrybutWartoscGet (entityName nazwaAtrybutu / enx wynik) 
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

(defun pl:string2list (str separator / pos len lst) 
  (setq len (1+ (strlen separator)))
  (while (setq pos (vl-string-search separator str)) 
    (setq lst (cons (substr str 1 pos) lst)
          str (substr str (+ pos len))
    )
  )
  (reverse (cons str lst))
)

(defun pl:list2string (lst separator / str) 
  (setq str (car lst))
  (foreach itm (cdr lst) (setq str (strcat str separator itm)))
  str
)