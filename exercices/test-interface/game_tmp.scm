

(define (asc-list from to)
   (if (> from to)
      '()
      (cons from (asc-list (+ from 1) to))))

(define (make-deck) 
  (asc-list 1 52))



;(define deck (cadr game))
;(define players (car game))
;(define discard (caddr game))

(define deck (make-deck))
(define players (list))
(define discard (list))









(define (list-set! list k val)
    (if (zero? k)
        (set-car! list val)
        (list-set! (cdr list) (- k 1) val)))
(define (deck-set!-1 list k val)
	(list-set! list (- k 1) val))
(deck-set!-1 deck 5 10) 
(define (switch-deck list index1 index2)
	(if (< index1 index2)
		(let (  (tmp (list-ref list (- index2 1)))
				(index1 (- index1 1))
				(index2 (- index2 1)) )
			(list-set! list index2 (list-ref list index1))
			(list-set! list index1 tmp))))
(define (shuffle list)
	(if (> (length list) 2)
		(begin
			(switch-deck list 1 (random-integer (+ 1 (length list))))
			(shuffle (cdr list)) )))
(define (set-cadr! list newvalue)
	(set-car! (cdr list) newvalue))
(define (shuffle-deck)
	(shuffle deck))

(define index '())
(define (store-index num list) 
	(if (null? list)
		(set! index (cons num (cons 1 index)))
		(if (eqv? num (car list))
			(set-cadr! list (+ (cadr list) 1) )
			(store-index num (cddr list)))))
(define (find-and-store number list #!optional (i 0))
	(if (eqv? (car list) number)
		(store-index i index)
		(find-and-store number (cdr list) (+ i 1))))
(define (stats-shuffle n i)
	(if (positive? n)
		(begin
			(set-car! (cdr game) (make-deck))
			(shuffle deck)
			(find-and-store i deck)
			(stats-shuffle (- n 1) i))
		index))


(define (print-stats list)
	(if (not (null? list))
		(begin 
			(println (string-append (number->string (car list)) "," (number->string (cadr list))))
			(print-stats (cddr list)))))
(define (pl-init-example)
	(list
		'( (1 2 3 4 5) "Doudi" (4 30))
		'( (6 7 8 9 10) "Balboo" (14 56))
		'( (1 2 3 4 5) "titu" (34 27))
		))

(define (pl-add! name)
	(set-car! game (cons (list '() name '(0 0) ) players)))
(define (pl-howmany?)
	(length players))
(define (pl-player? name)
	(pl-byName-aux name players))
(define (pl-byName-aux name list)
	(if (not (null? list))
		(if (string=? (cadar list) name)
			(car list)
			(pl-byName-aux name (cdr list)))
		'() ))
(define (pl-hand? name)
	(let ((p (pl-player? name)))
		(if (not (null? p))
			(car p))))
(define (pl-scores? name)
	(let ((p (pl-player? name)))
		(if (not (null? p))
			(caddr p))))
(define (pl-score? name)
	(let ((p (pl-player? name)))
		(if (not (null? p))
			(car (caddr p)))))
(define (pl-total? name)
	(let ((p (pl-player? name)))
		(if (not (null? p))
			(cadr (caddr p)))))
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













(set-car! game (pl-init-example))


(define (game-deal nbcartes)
	(cond (>= nbcartes 0)
		(game-deal-one)))

(define (game-deal-one)
	(game-deal-aux players))

(define (game-deal-aux playerslist)
	(if (not (null? playerslist))
		(begin
			(println (caar playerslist))
			(set-car! (caar playerslist) (cons (caadr game) (car playerslist)))
			(remove-first! deck)
			(game-deal-aux (cdr playerslist)))
		"Hello"))


(define (remove-first! list)
	(set! list (cadr list)))
;(##repl-debug-main)
;gsc -target js -exe -o game.js game.scm

