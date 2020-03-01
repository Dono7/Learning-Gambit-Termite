; gsc -target js -warnings -link -flat exo01.scm 

; Include the local weblib library
(include "../../../lib/weblib.scm")

;  Document.write allows to overwrite code in the document
(define (document.write msg)
  (##inline-host-statement "document.write(g_scm2host(@1@));" msg))

; body-append allows to add/append some code in the body
(define (body-append msg)
  (##inline-host-statement "document.getElementById(\"body\").innerHTML += g_scm2host(@1@);" msg))
  ; Classic error : do not forget the ; at the end 


; this function set the 'displayHello' method as the 'proc' scm procedure
; this function only work for a variable called 'displayHello', but we could
; add a parameter to define the name of the function and the function
(define (button-click-set! proc)
  (##inline-host-statement "displayHello = g_scm2host(@1@);" proc))

; Main function
(define (main) 

  ;creating the displayHello fonction
  (button-click-set! (lambda ()
    (body-append "<h1>Hello ! This is my new h1</h1>")))

  (document.write "<input type=\"submit\" value=\"Add Hello !\" onclick=\"displayHello()\"></input>")
  (document.write "<h1>Hello World !</h1>")
)

; launch the main function
(main)