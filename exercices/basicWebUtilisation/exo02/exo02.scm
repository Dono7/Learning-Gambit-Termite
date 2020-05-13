; cd Documents/Learning-Gambit-Termite/exercices/myOwnExercices/exo02/
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

; get the input value as a Scheme String
(define (get-input-value) 
  (##inline-host-expression "g_host2scm(document.getElementById(\"myinput\").value )"))

; body-append allows to add/append some code in the body
; The log is made by getting the information in Scheme and giving it back to JS
; The Alert is made directly by asking the browser to get and use the information
(define (alert-input-msg)
  (define myinput-content (get-input-value))
  (log myinput-content)
  (##inline-host-statement "alert (document.getElementById(\"myinput\").value );" ))


; this function set the 'displayInputText' method as the 'proc' scm procedure
; this function only work for a variable called 'displayInputText', but we could
; add a parameter to define the name of the function and the function
(define (button-click-set! proc)
  (##inline-host-statement "displayInputText = g_scm2host(@1@);" proc))

; Main function
(define (main) 

  (document.write "<input type=\"submit\" value=\"Display the following text in Alert !\" onclick=\"displayInputText()\"></input>")
  (document.write "<input type=\"text\" id=\"myinput\"></input>")

  (button-click-set! (lambda () 
    (alert-input-msg)))
)

; launch the main function
(main)
