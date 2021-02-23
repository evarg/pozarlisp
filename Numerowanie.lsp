; ************************************************************************ ;
; * Zmienne globalne                                                     * ;
; ************************************************************************ ;
(setq incMaska "1/##")
(setq incStartOd 1)
(setq incKrok 1)
(setq incLiczbaCyfr 1)
(setq incAtrybut "centrala")


(defun ListaWszystkichWarstw2 ()
	(setq 
		LL '()
		NL (tblnext "LAYER" T)
		IDX 0
	)
	
	(while NL
		(if (= (getvar "CLAYER") (cdr (assoc 2 NL)))
			(setq CL IDX)
			(setq IDX (1+ IDX))
		)
		
		(setq 
			LL (append LL (list (cdr (assoc 2 NL))))
			NL (tblnext "LAYER")
		) 
	)
	LL
)

(defun ListaWszystkichWarstw ()
	(setq 
		LayersList '()
		NextLayer (tblnext "LAYER" T)
	)
	
	(while NextLayer
		(setq 
			LayersList (append LayersList (list (cdr (assoc 2 NextLayer))))
			NextLayer (tblnext "LAYER")
		) 
	)
	LayersList
)

(defun PobierzWarstwy( / table)
	(progn
		(vlax-for lyr(
			vla-get-layers(
				vla-get-activedocument(vlax-get-acad-object)
			)
		)
		(setq table (cons (vla-get-name lyr) table)))
		table
	)
)


(defun Numerowanie( / da da1 da2 ile_danych ed)
	(progn
		(prompt "\nWybierz blok do zmiany jego atrybutu:")

		(while 1 
			(prompt "\nWybierz blok do zmiany jego atrybutu:")
			
			(setq nowaWartosc (vl-string-subst (itoa incStartOd) "##" incMaska))
			(setq incStartOd (+ incStartOd incKrok))
			
			(BlokAtrybutWartoscSet (car (entsel)) incAtrybut nowaWartosc)	
		)
	)
)

(defun NumerowanieSetup()
	(setq dcl_id(load_dialog (strcat PATH_SKRYPT "NumerowanieSetup.dcl")))
	(new_dialog "NumerowanieSetup" dcl_id)
	
	(set_tile "dclMaska" incMaska)
	(set_tile "dclStartOd" (itoa incStartOd))
	(set_tile "dclKrok" (itoa incKrok))
	(set_tile "dclLiczbaCyfr" (itoa incLiczbaCyfr))
	(set_tile "dclAtrybut" incAtrybut)
	
;	(cond 
;		((= incKrok 1) (set_tile "dclKrokCo" 3)) 
;	)
	
	(action_tile "zapisz"
		"
			(setq incMaska (get_tile \"dclMaska\"))
			(setq incStartOd (atoi (get_tile \"dclStartOd\")))
			(setq incKrok (atoi (get_tile \"dclKrok\")))
			(setq incLiczbaCyfr (atoi (get_tile \"dclLiczbaCyfr\")))
			(setq incAtrybut (get_tile \"dclAtrybut\"))

			(done_dialog -1)
		"
	)

	(action_tile "anuluj"
		"
			(done_dialog -1)
		"
	)

	(action_tile "numeruj"
		"
			(setq incMaska (get_tile \"dclMaska\"))
			(setq incStartOd (atoi (get_tile \"dclStartOd\")))
			(setq incKrok (atoi (get_tile \"dclKrok\")))
			(setq incLiczbaCyfr (atoi (get_tile \"dclLiczbaCyfr\")))
			(setq incAtrybut (get_tile \"dclAtrybut\"))
			(done_dialog -1)
			(numerowanie)
		"
	)


	(start_dialog)
	(unload_dialog dcl_id)
)

(defun string-replace (search replace string count)
  (loop for start = (search search (or result string)
                            :start2 (if start (1+ start) 0))
        while (and start
                   (or (null count) (> count 0)))
        for result = (concatenate 'string
                                  (subseq (or result string) 0 start)
                                  replace
                                  (subseq (or result string)
                                          (+ start (length search))))
        do (when count (decf count))
        finally (return-from string-replace (or result string))))

(setq indeks 1)
(setq prefiks "1/")

(print "******************************************************************")
(print "* Wczytano plik ze skryptem: Numerowanie.lsp                     *")
(print "******************************************************************")
(print)