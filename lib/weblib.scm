(declare
  (standard-bindings)
  (extended-bindings)
  (not run-time-bindings)
  (mostly-generic)
  (block)
  (not safe)
  (optimize-dead-definitions)
  (not inline)
)

(define (identity x)
  x)

(define (not x)
  (##not x))

(define (fx+ x y)
  (if (##not (and (##fixnum? x) (##fixnum? y)))
      (error "fx+ expects fixnums")
      (##fx+ x y)))

(define (fx- x y)
  (if (##not (and (##fixnum? x) (##fixnum? y)))
      (error "fx- expects fixnums")
      (##fx- x y)))

(define (fx* x y)
  (if (##not (and (##fixnum? x) (##fixnum? y)))
      (error "fx* expects fixnums")
      (##fx* x y)))

(define (fxquotient x y)
  (if (##not (and (##fixnum? x) (##fixnum? y)))
      (error "fxquotient expects fixnums")
      (##fxquotient x y)))

(define (fxmodulo x y)
  (if (##not (and (##fixnum? x) (##fixnum? y)))
      (error "fxmodulo expects fixnums")
      (##fxmodulo x y)))

(define (fxremainder x y)
  (if (##not (and (##fixnum? x) (##fixnum? y)))
      (error "fxremainder expects fixnums")
      (##fxremainder x y)))
  
(define (fx= x y)
  (if (##not (and (##fixnum? x) (##fixnum? y)))
      (error "fx= expects fixnums")
      (##fx= x y)))

(define (fx< x y)
  (if (##not (and (##fixnum? x) (##fixnum? y)))
      (error "fx< expects fixnums")
      (##fx< x y)))

(define (fx> x y)
  (if (##not (and (##fixnum? x) (##fixnum? y)))
      (error "fx> expects fixnums")
      (##fx> x y)))

(define (fx<= x y)
  (if (##not (and (##fixnum? x) (##fixnum? y)))
      (error "fx<= expects fixnums")
      (##fx<= x y)))

(define (fx>= x y)
  (if (##not (and (##fixnum? x) (##fixnum? y)))
      (error "fx>= expects fixnums")
      (##fx>= x y)))

(define (null? x)
  (##null? x))

(define (pair? x)
  (##pair? x))

(define (list . x)
  x)

(define (cons x y)
  (##cons x y))

(define (car x)
  (if (##not (##pair? x))
      (error "car expects a pair")
      (##car x)))

(define (cdr x)
  (if (##not (##pair? x))
      (error "cdr expects a pair")
      (##cdr x)))

(define (##list-ref lst i)
  (if (##not (##pair? lst))
      (error "list-ref index out of range")
      (if (##fx> i 0)
          (##list-ref (##cdr lst) (##fx- i 1))
          (##car lst))))

(define (list-ref lst i)
  (##list-ref lst i))

(define (##length lst)
  (if (##pair? lst)
      (##fx+ 1 (##length (##cdr lst)))
      0))

(define (length lst)
  (##length lst))

(define (##append lst1 lst2)
  (if (##pair? lst1)
      (##cons (##car lst1) (##append (##cdr lst1) lst2))
      lst2))

(define (append lst1 lst2)
  (##append lst1 lst2))

(define (##map proc lst)
  (if (##pair? lst)
      (##cons (proc (##car lst)) (##map proc (##cdr lst)))
      '()))

(define (map proc lst)
  (if (##not (##procedure? proc))
      (error "map expects a procedure")
      (##map proc lst)))

(define (##for-each proc lst)
  (if (##pair? lst)
      (begin
        (proc (##car lst))
        (##for-each proc (##cdr lst)))
      '()))

(define (for-each proc lst)
  (if (##not (##procedure? proc))
      (error "for-each expects a procedure")
      (##for-each proc lst)))

(define (##raise-wrong-number-of-arguments-exception-nary . rest)
  (error "wrong number of arguments"))

(define (error msg)
  (##inline-host-statement
   "var msg = '*** ERROR -- ' + g_scm2host(@1@);
    if (this.hasOwnProperty('console')) console.log(msg); else alert(msg);
    process.exit(1);"
   msg))

(declare
  (standard-bindings)
  (extended-bindings)
  (not run-time-bindings)
  (mostly-generic)
  (block)
  (safe)
  (optimize-dead-definitions)
  (not inline)
)
