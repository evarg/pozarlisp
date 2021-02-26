(print "Wczytywanie pozycjonowanieBloku.lsp")

(defun wyrownanieBlokuPion(/ blokPodstawowy, blokDoPodmiany, bazaX, bazaY, blokX, blokY)
	(setq blokPodstawowy (car (entsel "Wybierz blok wzgledem ktorego ma byc pozycjonowanie")))
	(setq bazaX (car (BlokPozycjaGet blokPodstawowy)))
	(setq bazaY (cadr (BlokPozycjaGet blokPodstawowy)))
	
	(while 1
		(setq blokDoPodmiany (entsel "Wybierz blok ktory ma byc pozycjonowy"))
		(setq blokX (car (BlokPozycjaGet (car blokDoPodmiany))))
		(setq blokY (cadr (BlokPozycjaGet (car blokDoPodmiany))))

		(command "._move" blokDoPodmiany "" (BlokPozycjaGet (car blokDoPodmiany)) (list bazaX blokY))
	)
)

(defun wyrownanieBlokuPoziom(/ blokPodstawowy, blokDoPodmiany, bazaX, bazaY, blokX, blokY)
	(setq blokPodstawowy (car (entsel "Wybierz blok wzgledem ktorego ma byc pozycjonowanie")))
	(setq bazaX (car (BlokPozycjaGet blokPodstawowy)))
	(setq bazaY (cadr (BlokPozycjaGet blokPodstawowy)))
	
	(while 1
		(setq blokDoPodmiany (entsel "Wybierz blok ktory ma byc pozycjonowy"))
		(setq blokX (car (BlokPozycjaGet (car blokDoPodmiany))))
		(setq blokY (cadr (BlokPozycjaGet (car blokDoPodmiany))))

		(command "._move" blokDoPodmiany "" (BlokPozycjaGet (car blokDoPodmiany)) (list blokX bazaY))
	)
)
