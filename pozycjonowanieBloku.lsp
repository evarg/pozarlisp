(print "Wczytywanie pozycjonowanieBloku.lsp")

(defun wyrownanieBlokuPion()
	(setq blokPodstawowy (car (entsel "Wybierz blok wzgledem ktorego ma byc pozycjonowanie")))
	(setq bazaX (car (BlokPozycjaGet blokPodstawowy)))
	
	(while 1
		(setq blokDoPodmiany (car (entsel "Wybierz blok ktory ma byc pozycjonowy")))
		(setq nowyY (cadr (BlokPozycjaGet blokDoPodmiany)))
		(BlokPozycjaSet blokDoPodmiany (list bazaX nowyY))
	)
)

(defun wyrownanieBlokuPoziom()
	(setq blokPodstawowy (car (entsel "Wybierz blok wzgledem ktorego ma byc pozycjonowanie")))
	(setq bazaX (car (BlokPozycjaGet blokPodstawowy)))
	(setq bazaY (cadr (BlokPozycjaGet blokPodstawowy)))
	
	(while 1
		(setq blokDoPodmiany (entsel "Wybierz blok ktory ma byc pozycjonowy"))
		(setq blokX (car (BlokPozycjaGet (car blokDoPodmiany))))
		(setq blokY (cadr (BlokPozycjaGet (car blokDoPodmiany))))

		(setq roznicaY (- blokY bazaY))

		(command "._move" blokDoPodmiany "" (list 0 0) (list 0 roznicaY))

	)
)
