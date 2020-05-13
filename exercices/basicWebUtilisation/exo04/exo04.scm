; cd ~/Documents/Learning-Gambit-Termite/exercices/myOwnExercices/exo04/
; gsc -target js -warnings -link -flat exo04.scm 

; Include the local weblib library
(include "../../../lib/weblib.scm")

; Call the JavaScript Console.log function
(define (log msg)
  (##inline-host-statement "console.log(g_scm2host(@1@));" msg))

(define (string-append-2 s1 s2)
  (##inline-host-expression "g_host2scm(g_scm2host(@1@)+g_scm2host(@2@))" s1 s2))

; Doesn't work
(define (string-append-native s1 s2)
  (##string-append s1 s2))

; Works, but needs a list of strings
(define (string-append-list strlist)
  (if (null? strlist)
    ""
    (string-append-2 (car strlist) (string-append-list (cdr strlist)))))

; Works no matter how many arguments, and do not required a list
(define (string-append-multiarg . args)
  (if (null? args)
    ""
    (string-append-2 (car args) (string-append-list (cdr args)))))

; Main function
(define (main) 
  (log (string-append-2 "hello " "world !"))
  ;(log (string-append-native "hello " "native !"))
  (log (string-append-list '("hello" "world !" "on peut mettre" "autant d'argument" "qu'on veut <3")))
  (log (string-append-multiarg "hello" "world !" "on peut mettre" "autant d'argument" "qu'on veut " "sans avoir besoin" " de listes !"))
)

; launch the main function
(main)
