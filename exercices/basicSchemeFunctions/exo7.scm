; Distribuer les cartes

(define (game-deal nbcartes)
	(cond (>= nbcartes 0)
		(game-deal-one)))

(define (game-deal-one)
	(game-deal-aux (car game)))

(define (game-deal-aux playerslist)
	(if (not (null? playerslist))
		(println (car playerslist))
		;(begin
		;	(set-car! (car playerslist) (cons (car deck) (car playerslist)))
		;	(set! deck (cdr deck))
		;	(game-deal-aux (cdr playerslist)))
		"Hello"))


;(define (pl-init-example2)
;	(list
;		'( () "Dony" (4 30))
;		'( () "Delphy" (14 56))
;		'( () "Brybry" (34 27))
;		))




