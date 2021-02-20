(print "Wczytany pozycjonowanie.lsp")

; stale dt justowania
(defconstant J_LEFT 0)
(defconstant J_CENTER 1)
(defconstant J_RIGHT 2)
(defconstant J_UP 3)
(defconstant J_MIDDLE 2)
(defconstant J_DOWN 1)

(defconstant odstepXR -220)
(defconstant odstepXL 220)
(defconstant odstepYU 220)
(defconstant odstepYD -220)


(defun ssp:AtrybutWszystko ( blok / end enx )
;	(setq blk (cdr (assoc -1 (entget (car blok)))))

	(setq blk blok)
	
	(while
        (and
            (null end)
            (= "ATTRIB" (cdr (assoc 0 (setq enx (entget (setq blk (entnext blk)))))))
        )
		
		(print enx)
    )
	wynik
)


(defun ssp:DCL_PozycjonowanieAtrybutu()	
	(setq dcl_id (load_dialog (strcat PATH_SKRYPT "wPozycjonowanieAtrybutu.dcl")))

	(setq nastepny 1)

	(while (not(>= 0 nastepny))
		(setq blok (entsel))		
		(setq skalaBloku (BlokSkalaGet (car blok)))

		(new_dialog "wPozycjonowanieAtrybutu" dcl_id)

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
				(BlokAtrybutParametrJustifyHorizontalSet (car blok) \"centrala\" J_RIGHT)
				(BlokAtrybutParametrJustifyVerticalSet (car blok) \"centrala\" J_DOWN)
				(AtrybutPozycjaSet (car blok) \"centrala\" (* skalaBloku odstepXR) (* skalaBloku odstepYU))
 			"
		) 

		(action_tile "uc" 
			"
				(BlokAtrybutParametrJustifyHorizontalSet (car blok) \"centrala\" J_CENTER)
				(BlokAtrybutParametrJustifyVerticalSet (car blok) \"centrala\" J_DOWN)
				(AtrybutPozycjaSet (car blok) \"centrala\" 0 (* skalaBloku odstepYU))
			"
		) 

		(action_tile "ur" 
			"
				(BlokAtrybutParametrJustifyHorizontalSet (car blok) \"centrala\" J_LEFT)
				(BlokAtrybutParametrJustifyVerticalSet (car blok) \"centrala\" J_DOWN)
				(AtrybutPozycjaSet (car blok) \"centrala\" (* skalaBloku odstepXL) (* skalaBloku odstepYU))
		"
		) 

		(action_tile "ml" 
			"
				(BlokAtrybutParametrJustifyHorizontalSet (car blok) \"centrala\" J_RIGHT)
				(BlokAtrybutParametrJustifyVerticalSet (car blok) \"centrala\" J_MIDDLE)
				(AtrybutPozycjaSet (car blok) \"centrala\" (* skalaBloku odstepXR) 0)
							"
		) 

		(action_tile "mc" 
			"
				(BlokAtrybutParametrJustifyHorizontalSet (car blok) \"centrala\" J_CENTER)
				(BlokAtrybutParametrJustifyVerticalSet (car blok) \"centrala\" J_MIDDLE)
				(AtrybutPozycjaSet (car blok) \"centrala\" 0 0)
			"
		) 

		(action_tile "mr" 
			"
				(BlokAtrybutParametrJustifyHorizontalSet (car blok) \"centrala\" J_LEFT)
				(BlokAtrybutParametrJustifyVerticalSet (car blok) \"centrala\" J_MIDDLE)
				(AtrybutPozycjaSet (car blok) \"centrala\" (* skalaBloku odstepXL) 0)
			"
		) 

		(action_tile "dl" 
			"
				(BlokAtrybutParametrJustifyHorizontalSet (car blok) \"centrala\" J_RIGHT)
				(BlokAtrybutParametrJustifyVerticalSet (car blok) \"centrala\" J_UP)
				(AtrybutPozycjaSet (car blok) \"centrala\" (* skalaBloku odstepXR) (* skalaBloku odstepYD))
			"
		) 

		(action_tile "dc" 
			"
				(BlokAtrybutParametrJustifyHorizontalSet (car blok) \"centrala\" J_CENTER)
				(BlokAtrybutParametrJustifyVerticalSet (car blok) \"centrala\" J_UP)
				(AtrybutPozycjaSet (car blok) \"centrala\" 0 (* skalaBloku odstepYD))
			"
		) 

		(action_tile "dr" 
			"
				(BlokAtrybutParametrJustifyHorizontalSet (car blok) \"centrala\" J_LEFT)
				(BlokAtrybutParametrJustifyVerticalSet (car blok) \"centrala\" J_UP)
				(AtrybutPozycjaSet (car blok) \"centrala\" (* skalaBloku odstepXL) (* skalaBloku odstepYD))
			"
		) 

		
		(start_dialog)
	)
	(unload_dialog dcl_id)
)
