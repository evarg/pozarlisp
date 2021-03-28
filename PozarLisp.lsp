; sciezki dostepu
(setq PATH_SKRYPT "d:\\pozarlisp\\")
(setq PATH_BLOKI (strcat PATH_SKRYPT "Bloki\\"))
(setq PATH_SYSTEMY (strcat PATH_SKRYPT "Systemy\\"))

; includowanie
(load (strcat PATH_SKRYPT "Konfiguracja.lsp"))
(load (strcat PATH_SKRYPT "App\\Log.lsp"))
(load (strcat PATH_SKRYPT "App\\AppSetup.lsp"))
(load (strcat PATH_SKRYPT "App\\Warstwy.lsp"))
(load (strcat PATH_SKRYPT "App\\Bloki.lsp"))
(load (strcat PATH_SKRYPT "App\\Atrybuty.lsp"))
(load (strcat PATH_SKRYPT "App\\SystemPozarowy.lsp"))
(load (strcat PATH_SKRYPT "App\\PolaczCzujki.lsp"))
(load (strcat PATH_SKRYPT "App\\Elementy.lsp"))

; includowanie systemow
(load (strcat PATH_SKRYPT "App\\Systemy\\AWEX.lsp"))
(load (strcat PATH_SKRYPT "App\\Systemy\\BOSCH.lsp"))
(load (strcat PATH_SKRYPT "App\\Systemy\\ESSER.lsp"))
(load (strcat PATH_SKRYPT "App\\Systemy\\EST3.lsp"))
(load (strcat PATH_SKRYPT "App\\Systemy\\FP2000.lsp"))
(load (strcat PATH_SKRYPT "App\\Systemy\\POLON4000.lsp"))


; zmienne globalne
(setq LOG_SZEROKOSC 80)

(defun c:PozarLisp () 
  (print "PozarLisp v 0.1")
)

(defun pl:About () 
  (setq dcl_id (load_dialog (strcat PATH_SKRYPT "About.dcl")))

  (new_dialog "dclAbout" dcl_id)

  (action_tile "ok" 
               "
				(done_dialog 1)
			"
  )

  (start_dialog)
  (unload_dialog dcl_id)
)