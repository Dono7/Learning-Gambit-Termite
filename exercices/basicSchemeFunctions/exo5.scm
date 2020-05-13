
(define (set-cadr! list newvalue)
	(set-car! (cdr list) newvalue))

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
			(set! deck (make-deck))
			(shuffle deck)
			(find-and-store i deck)
			(stats-shuffle (- n 1) i))
		index))

(define (print-stats list)
	(if (not (null? list))
		(begin 
			(println (string-append (number->string (car list)) "," (number->string (cadr list))))
			(print-stats (cddr list)))))


; exemple of use
; needs the 4 first ex to works
;(print-stats (stats-shuffle 1000 1))