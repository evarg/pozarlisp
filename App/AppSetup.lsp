(defun pl:AppSetup () 
  (setq dcl_id (load_dialog (strcat PATH_SKRYPT "App\\AppSetup.dcl")))

  (new_dialog "dclAppSetup" dcl_id)

  (set_tile "lb1" "C")
  
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
 			"
  )

  (start_dialog)
  (unload_dialog dcl_id)
)
