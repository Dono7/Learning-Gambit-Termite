; gsc -target js -warnings -link -flat exo02.scm 

; Include the local weblib library
(include "../../../lib/weblib.scm")

; Call the JavaScript Alert function
(define (alert msg)
  (##inline-host-statement "alert(g_scm2host(@1@));" msg))

; Call the JavaScript Console.log function
(define (log msg)
  (##inline-host-statement "console.log(g_scm2host(@1@));" msg))

;  Document.write allows to overwrite code in the document
(define (document.write msg)
  (##inline-host-statement "document.write(g_scm2host(@1@));" msg))

;(define (get-input-value) 
;  (##inline-host-statement "g_host2scm(document.getElementById(\"myinput\").value )"))

; body-append allows to add/append some code in the body
(define (alert-input-msg)
  ;(define myinput-content "hello")
  ;(define myinput-content (##inline-host-statement "g_host2scm(g_scm2host(@1@))" "document.getElementById(\"myinput\").value"))
  ;(define myinput-content (##inline-host-statement "g_host2scm(document.getElementById(\"myinput\").value )"))
  ;(alert myinput-content)
  ;(log myinput-content) )
  (##inline-host-statement "alert (document.getElementById(\"myinput\").value );" ) )
  ;(alert (get-input-value)))


; this function set the 'displayHello' method as the 'proc' scm procedure
; this function only work for a variable called 'displayHello', but we could
; add a parameter to define the name of the function and the function
(define (button-click-set! proc)
  (##inline-host-statement "displayInputText = g_scm2host(@1@);" proc))

; Main function
(define (main) 

  (document.write "<input type=\"submit\" value=\"Display the following text in Alert !\" onclick=\"displayInputText()\"></input>")
  (document.write "<input type=\"text\" id=\"myinput\"></input>")

  ;(##inline-host-statement "console.log(g_host2scm(@1@));" "document.getElementById(\"myinput\").value")

  (button-click-set! (lambda () 
    (alert-input-msg)))
)

; launch the main function
(main)
