
; Création d'un exemple de 3 joueurs
(define (pl-init-example)
	(list
		'( (1 2 3 4 5) "Doudi" (4 30))
		'( (6 7 8 9 10) "Balboo" (14 56))
		'( (1 2 3 4 5) "titu" (34 27))
		))

; Variable globale
(define players '())
;(set! players (pl-init-example))


; Opération sur la liste des joueurs
(define (pl-add! name)
	(set! players (cons (list '() name '(0 0) ) players)))

(define (pl-howmany?)
	(length players))




; ---------- GETTERS

; Get à partir du nom d'un joueur

; Fonction de base : Get un joueur complet à partir du nom
(define (pl-player? name)
	(pl-byName-aux name players))

(define (pl-byName-aux name list)
	(if (not (null? list))
		(if (string=? (cadar list) name)
			(car list)
			(pl-byName-aux name (cdr list)))
		'() ))



; Get sa main (liste de cartes)
(define (pl-hand? name)
	(let ((p (pl-player? name)))
		(if (not (null? p))
			(car p))))

; Get ses scores
(define (pl-scores? name)
	(let ((p (pl-player? name)))
		(if (not (null? p))
			(caddr p))))
; Scores = la paie, score = celui de la manche en cours
(define (pl-score? name)
	(let ((p (pl-player? name)))
		(if (not (null? p))
			(car (caddr p)))))
(define (pl-total? name)
	(let ((p (pl-player? name)))
		(if (not (null? p))
			(cadr (caddr p)))))



; ---------- SETTERS

; Changer le nom
(define (pl-changeName! playername newname)
	(let ((p (pl-player? playername)))
		(if (not (null? p))
			(set-car! (cdr p) newname))))

(define (pl-addScore! name int)
	(let ((p (pl-player? name)))
		(if (not (null? p))
				(set-car! (caddr p) (+ int (caaddr p))))))
			

(define (pl-score! name newscore)
	(let ((p (pl-player? name)))
		(if (not (null? p))
			(set-car! (caddr p) newscore))))

(define (pl-scores! name scorepair)
	(let ((p (pl-player? name)))
		(if (not (null? p))
			(set-car! (cddr p) scorepair))))




; ---------- PRINTERS

(define (pl-print p)
	(println (name? p) "\t" (score? p) ":" (total? p) "\t[ " (hand->string (hand? p)) "]"))
(define (pl-print-all)
	(pl-print-all-aux players))
(define (pl-print-all-aux list)
	(if (not (null? list))
		(begin 
			(pl-print (car list))
			(pl-print-all-aux (cdr list)))))

(define (name? p)
	(cadr p))
(define (score? p)
	(caaddr p))
(define (total? p)
	(cadr (caddr p)))
(define (hand? p)
	(car p))
(define (hand->string h)
	(if (not (null? h))
		(string-append (number->string (car h)) " " (hand->string (cdr h)))
		""))


