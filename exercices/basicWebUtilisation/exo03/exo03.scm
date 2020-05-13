; cd ~/Documents/Learning-Gambit-Termite/exercices/myOwnExercices/exo03/
; gsc -target js -warnings -link -flat exo03.scm 

; Include the local weblib library
(include "../../../lib/weblib.scm")

; Utilisation de string-append jusqu'à 3 arguments max
;(define (string-append #!optional (a "") (b "") (c ""))
;  (##inline-host-expression "g_host2scm(g_scm2host(@1@)+g_scm2host(@2@)+g_scm2host(@3@))" a b c))


; Call the JavaScript Console.log function
(define (log msg)
  (##inline-host-statement "console.log(g_scm2host(@1@));" msg))

; Add content at the end of the body content
(define (body-append msg)
  (##inline-host-statement "body.innerHTML += (g_scm2host(@1@));" msg) )
(define (body-append-br msg)
  (##inline-host-statement "body.innerHTML += (g_scm2host(@1@));" msg) 
  (body-append "<br/>"))

; Create tags, for exemple <p></p> (or solo-tag, for exemple <br/>)
(define (tag tagname)
  (##inline-host-expression "g_host2scm(\"<\"+g_scm2host(@1@)+\"></\"+g_scm2host(@1@)+\">\")" tagname))
(define (tag-solo tagname)
  (##inline-host-expression "g_host2scm(\"<\"+g_scm2host(@1@)+\"/>\")" tagname))

; Write a button 
(define (btn-color color)
  (body-append-br (##inline-host-expression "g_host2scm(\"<button onclick=\\\"colorise('\"+g_scm2host(@1@)+\"')\\\">\"+g_scm2host(@1@)+\"</button>\")" color) ) )

(define (colored-div)
  (body-append "<div id=\"col\"></div>"))

; Cannot use this function, because the funName will be considered as a Const String and not the function name
(define (function-set funcName proc)
  (##inline-host-statement "g_scm2host(@1@) = g_scm2host(@2@)" funcName proc))

; Permet d'associer une procédure à "colorise"
(define (button-click-set! proc)
  (##inline-host-statement "colorise = g_scm2host(@1@);" proc))

; Main function
(define (main) 

  ; Creations des boutons avec le code couleur
  (btn-color "yellow")
  (btn-color "blue")
  (btn-color "red")
  (btn-color "yellow")
  (btn-color "#28F15C")
  (btn-color "rgb(230,112,45)")

  (body-append-br "<p>This works with every type of color code.</p>")
  ; Creation de la div qui changera de couleur
  (colored-div)

  ;(function-set "colorise" (lambda (color)
  (button-click-set! (lambda (color)
    (##inline-host-statement "document.getElementById('col').style.backgroundColor = g_scm2host(@1@) ;" color)))

)

; launch the main function
(main)
