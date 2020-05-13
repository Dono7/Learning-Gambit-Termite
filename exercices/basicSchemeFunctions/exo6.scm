
; Création d'un exemple de 3 joueurs
(define (pl-init-example)
	(list
		'((1 2 3 4 5) "Doudi" (4 30))
		'((6 7 8 9 10) "Balboo" (14 56))
		'((1 2 3 4 5) "titu" (34 27))
		))

; Variable globale
(define players '())
(set! players (pl-init-example))


; Opération sur la liste des joueurs
(define (pl-add p)
	(set! players (cons p players)))

(define (pl-howmany?)
	(length players))



; Opération sur un joueur


(define (pl-hand? p)
	(car p))

(define (pl-name? p)
	(begin
		(println (cadr p))
		(cadr p)))

(define (pl-scores? p)
	(caddr p))
(define (pl-score-manche? p)
	(car (caddr p)))
(define (pl-score-total? p)
	(cadr (caddr p)))

(define (pl-getByName name)
	(pl-getByName-aux name players))

(define (pl-getByName-aux name list)
	(if (not (null? list))
		(if (eqv? (pl-name? (car list)) name)
			(car list)
			(pl-getByName-aux name (cdr list)))
		'()))