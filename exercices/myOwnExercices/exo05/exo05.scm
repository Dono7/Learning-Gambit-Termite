; cd ~/Documents/Learning-Gambit-Termite/exercices/myOwnExercices/exo05/
; gsc -target js -warnings -link -flat exo05.scm 

; Include the local weblib library
(include "../../../lib/weblib.scm")
(include "../../../lib/basicslib.scm")
(include "../../../lib/jslib.scm")

; Main function
;(let (main) 
  (body-append-br "Un premier text avec line break")
  (body-append "et un second sans line break. ")
  (body-prepend-br "je te vole la place du prems")
  (body-append-text-br "ceci est du <b>text only</b>, les tags ne marchent pas")

  (body-append "<div id='red-square' style='background:red;height:300px;width:300px'></div>")

  ;(define mysquare (DOM-getById "red-square"))
  ;(DOM-log mysquare)
  ;(DOM-rmv mysquare)


  ;(log (string-append "coucou size : " (string-length "coucou")))
  ;(log (string-length "coucou"))
  ;(log (string-length "1234"))
  ;(log-int 56)
  ;(log 3.14)
  ;(log (toString 285439))
  ;(log (string? "coucou"))
  ;(log (string? 56))

  ;(DOM-log (DOM-body))
  ;(alert ((DOM-body-scm)))
  ;(log (DOM-body-scm))



  (log "start")
  ; Test sur les Log pour le rapport de Remarques et Suggestions
  (define v1 #\c)
  (define v2 "Hello")
  (define v3 23)
  (define v4 3.14)
  (define v5 2+3i)
  (define v6 -22/7)
  (define v7 #f)
  (define v8 (DOM-body))
  (define v9 2+3i)

  ;(DOM-log v7)
  ;(log-toStr v8)
  ;(log-char #\c)

  (log-str "hello")
  (log-int 245)
  (log-char #\h)
  (log-real 3.14)
  (log-rat 22/9)
  (log-rat -22/9)
  (log-comp 2+3i)
  (log-comp 5-2i)
  (log-obj (DOM-body))
  (log-bool (positive? 5))
  (log-bool (positive? -5))
  (log-bool (positive? 0))
  


  (log "end")
;)

; launch the main function
;(main)
