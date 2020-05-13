




; From index 0 :
 (define (switch-deck list index1 index2)
	(if (< index1 index2)
		(let (  (tmp (list-ref list (- index2 1)))
				(index1 (- index1 1))
				(index2 (- index2 1)) )
			(list-set! list index2 (list-ref list index1))
			(list-set! list index1 tmp))))