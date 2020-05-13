; Compile :
;

; consigne :
; Ecrire une function qui renvoie une liste d'entiers allant de 1 à n


; found here : https://stackoverflow.com/questions/47737667/how-to-create-a-function-that-makes-a-list-that-contains-1-2-3-4-5-to-n-in-sc
(define (asc-list from to)
   (if (> from to)
      '()
      (cons from (asc-list (+ from 1) to))))
; (asc-list  2 7) => (2 3 4 5 6 7)


; Make a list from 1 to 52 (both included)
(define (make-deck) 
  (asc-list 1 52))

(define deck (make-deck))

