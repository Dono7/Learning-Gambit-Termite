; This library needs weblib to work


; Type verification

(define (char? var)
  (##char? var))

(define (str? var)
  (##string? var))

(define (int? var)
  (##inline-host-expression "g_host2scm( Number.isInteger(@1@) )" var))

(define (float? var)
  (##inline-host-expression "JSON.stringify(Object.keys(@1@)) === JSON.stringify([\"val\"])" var))

(define (comp? var)
  (##inline-host-expression "JSON.stringify(Object.keys(@1@)) === JSON.stringify([\"real\",\"imag\"])" var))

(define (rat? var)
  (##inline-host-expression "JSON.stringify(Object.keys(@1@)) === JSON.stringify([\"num\",\"den\"])" var))

(define (bool? var)
  (##boolean? var))

; This returns #t if the JavaScript consider it as an Object.
; Complex and Rationel numbers are considered as objects.
(define (object? var)
  (##inline-host-expression "@1@.toString() == \"[object Object]\"" var))

; Not completly satisfying, but this is working for now
; UPDATE : No this does not work :( 
(define (DOM? var)
  (if (object? var)
    (##inline-host-expression "g_host2scm(@1@.nodeName == undefined)" var)
    #f ))

(define (num? var) 
  (or
    (int? var)
    (float? var)
    (comp? var)
    (rat? var) ))


; Easier proc name. Not tested yet
(define (s2h data)
  ("g_scm2host(@1@)" data))

(define (h2s data)
  ("g_host2scm(@1@)" data))

(define (string-append . strings)
  (if (null? strings)
    (log "fin de string")
    (string-append-js (car strings) (string-append-list (cdr strings)))))

; This version of String Append only works with a list of strings as argument
(define (string-append-list strlist)
  (if (null? strlist)
    ""
    (string-append-js (car strlist) (string-append-list (cdr strlist)))))

; This version of String Append only works with 2 arguments.
; It is used in other string-append procedures for recursion
(define (string-append-js str1 str2)
  (##inline-host-expression "g_host2scm(g_scm2host(@1@)+g_scm2host(@2@))" str1 str2))

(define (string-length str)
  (##inline-host-expression "g_host2scm(g_scm2host(@1@).length)" str))

(define (toString num)
  (##inline-host-expression "g_host2scm(g_scm2host(@1@).toString())" num))

(define (positive? int)
  (##inline-host-expression "g_host2scm(@1@ > 0)" int))
