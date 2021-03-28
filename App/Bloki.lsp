;
; entityName - musi byc: (car (entsel))
;
(defun pl:BlokDXFGet (entityName) 
  (setq wynik (entget entityName))
  wynik
);defun

;
; entityName - musi byc: (car (entsel))
;
(defun pl:BlokPozycjaGet (entityName) 
  (cdr (assoc 10 (entget entityName)))
);defun

;
; entityName - musi byc: (car (entsel))
;
(defun pl:BlokSkalaGet (entityName) 
  (cdr (assoc 41 (entget entityName)))
);defun

;
; wstawia na bierzacej warstwie nowy blok, w tym samym miejsci i kopiuje atrybut
;
(defun pl:BlokPodmien (nazwaBlokuS nazwaBlokuD skala nazwaAtrybutuS nazwaAtrybutuD) 
  (setq ss1 (ssget "_X" '((0 . "INSERT"))))
  (setq l 0)

  (repeat (sslength ss1) 
    (setq blokS (ssname ss1 l))
    (setq blokNazwa (cdr (assoc 2 (entget blokS))))

    (if (= blokNazwa nazwaBlokuS) 
      (progn 
        (setq pozycjaS (pl:BlokPozycjaGet blokS))
        (setq wartoscAtrybutuS (pl:AtrybutWartoscGet blokS nazwaAtrybutuS))
        (command "_insert" nazwaBlokuD pozycjaS skala skala 0)
        (setq blokWstawiony (entlast))
        (pl:AtrybutWartoscSet blokWstawiony nazwaAtrybutuD wartoscAtrybutuS)
      )
    )
    (setq l (+ l 1))
  )
)


(defun pl:BlokLista () 
  (vl-load-com)
  (setq plik (getfiled "Select A Directory" "raport" "csv" 1))
  (setq file_desc (open plik "w"))

  (print file_desc)


  (setq ss1 (ssget "_X" '((0 . "INSERT"))))
  (setq l 0)


  (repeat (sslength ss1) 
    (setq blokS (ssname ss1 l))
    (setq blokNazwa (cdr (assoc 2 (entget blokS))))

    (if (pl:CzyElement blokNazwa) 
      (progn 
        (setq pozycjaS (pl:BlokPozycjaGet blokS))
        (setq wartoscAtrybutuS (pl:AtrybutWartoscGet blokS "centrala"))
        (setq linia (strcat blokNazwa 
                            ";"
                            (rtos (car pozycjaS))
                            ";"
                            (rtos (cadr pozycjaS))
                            ";"
                            (pl:AtrybutWartoscGet blokS "centrala")
                            ";"
                            (pl:AtrybutWartoscGet blokS "plan")
                            ";"
                            (pl:AtrybutWartoscGet blokS "raw")
                    )
        )
        (write-line linia file_desc)
        ;(print file_desc)
        (close file_desc)
      )
    )

    (setq l (+ l 1))
  )
)