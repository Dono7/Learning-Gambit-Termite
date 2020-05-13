; Tout lancer







; exo 4


(define (shuffle list)
	(if (> (length list) 2)
		(begin
			(switch-deck list 1 (random-integer (+ 1 (length list))))
			(shuffle (cdr list)) )))
