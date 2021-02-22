(print "Wczytany pozycjonowanie.lsp")

; stale dt justowania
(defconstant J_LEFT 0)
(defconstant J_CENTER 1)
(defconstant J_RIGHT 2)
(defconstant J_UP 3)
(defconstant J_MIDDLE 2)
(defconstant J_DOWN 1)

(setq odstepXL 220)
(setq odstepYU 220)
(setq odstepXR -220)
(setq odstepYD -220)

(setq nazwaParametru "centrala")

(defun ssp:DCL_PozycjonowanieAtrybutu()	
	(setq dcl_id (load_dialog (strcat PATH_SKRYPT "wPozycjonowanieAtrybutu.dcl")))

	(setq nastepny 1)

	(while (not(>= 0 nastepny))
		(setq blok (entsel))		
		(setq skalaBloku (BlokSkalaGet (car blok)))

		(new_dialog "wPozycjonowanieAtrybutu" dcl_id)

		(set_tile "nazwaParametru" nazwaParametru)

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
				(BlokAtrybutParametrJustifyHorizontalSet (car blok) nazwaParametru J_RIGHT)
				(BlokAtrybutParametrJustifyVerticalSet (car blok) nazwaParametru J_DOWN)
				(AtrybutPozycjaSet (car blok) nazwaParametru (* skalaBloku odstepXR) (* skalaBloku odstepYU))
 			"
		) 

		(action_tile "uc" 
			"
				(BlokAtrybutParametrJustifyHorizontalSet (car blok) nazwaParametru J_CENTER)
				(BlokAtrybutParametrJustifyVerticalSet (car blok) nazwaParametru J_DOWN)
				(AtrybutPozycjaSet (car blok) nazwaParametru 0 (* skalaBloku odstepYU))
			"
		) 

		(action_tile "ur" 
			"
				(BlokAtrybutParametrJustifyHorizontalSet (car blok) nazwaParametru J_LEFT)
				(BlokAtrybutParametrJustifyVerticalSet (car blok) nazwaParametru J_DOWN)
				(AtrybutPozycjaSet (car blok) nazwaParametru (* skalaBloku odstepXL) (* skalaBloku odstepYU))
		"
		) 

		(action_tile "ml" 
			"
				(BlokAtrybutParametrJustifyHorizontalSet (car blok) nazwaParametru J_RIGHT)
				(BlokAtrybutParametrJustifyVerticalSet (car blok) nazwaParametru J_MIDDLE)
				(AtrybutPozycjaSet (car blok) nazwaParametru (* skalaBloku odstepXR) 0)
							"
		) 

		(action_tile "mc" 
			"
				(BlokAtrybutParametrJustifyHorizontalSet (car blok) nazwaParametru J_CENTER)
				(BlokAtrybutParametrJustifyVerticalSet (car blok) nazwaParametru J_MIDDLE)
				(AtrybutPozycjaSet (car blok) nazwaParametru 0 0)
			"
		) 

		(action_tile "mr" 
			"
				(BlokAtrybutParametrJustifyHorizontalSet (car blok) nazwaParametru J_LEFT)
				(BlokAtrybutParametrJustifyVerticalSet (car blok) nazwaParametru J_MIDDLE)
				(AtrybutPozycjaSet (car blok) nazwaParametru (* skalaBloku odstepXL) 0)
			"
		) 

		(action_tile "dl" 
			"
				(BlokAtrybutParametrJustifyHorizontalSet (car blok) nazwaParametru J_RIGHT)
				(BlokAtrybutParametrJustifyVerticalSet (car blok) nazwaParametru J_UP)
				(AtrybutPozycjaSet (car blok) nazwaParametru (* skalaBloku odstepXR) (* skalaBloku odstepYD))
			"
		) 

		(action_tile "dc" 
			"
				(BlokAtrybutParametrJustifyHorizontalSet (car blok) nazwaParametru J_CENTER)
				(BlokAtrybutParametrJustifyVerticalSet (car blok) nazwaParametru J_UP)
				(AtrybutPozycjaSet (car blok) nazwaParametru 0 (* skalaBloku odstepYD))
			"
		) 

		(action_tile "dr" 
			"
				(BlokAtrybutParametrJustifyHorizontalSet (car blok) nazwaParametru J_LEFT)
				(BlokAtrybutParametrJustifyVerticalSet (car blok) nazwaParametru J_UP)
				(AtrybutPozycjaSet (car blok) nazwaParametru (* skalaBloku odstepXL) (* skalaBloku odstepYD))
			"
		) 
		
		(action_tile "zmienNazwe" 
			"
				(setq nazwaParametru (get_tile \"nazwaParametru\"))
			"
		) 

		(start_dialog)
	)
	(unload_dialog dcl_id)
)
