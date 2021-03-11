(defun warstwa:Utworz (nazwa numerKoloru) 
  (if (not (tblsearch "LAYER" nazwa)) 
    (command "._layer" "_N" nazwa "_C" numerKoloru nazwa "")
  )
)

(defun warstwa:ZmienKolor (nazwa numerKoloru) 
    (command "._layer" "_C" numerKoloru nazwa "")
)