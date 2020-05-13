


; Found here : https://stackoverflow.com/questions/7382117/scheme-change-value-of-an-element-in-a-list
; This function modifies the list, does not return anything
(define (list-set! list k val)
    (if (zero? k)
        (set-car! list val)
        (list-set! (cdr list) (- k 1) val)))

; Same as list-set!, but index starts from 1
(define (deck-set!-1 list k val)
	(list-set! list (- k 1) val))





(deck-set!-1 deck 5 10)
deck

