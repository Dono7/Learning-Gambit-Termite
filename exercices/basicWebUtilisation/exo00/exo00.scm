; Include the local weblib library
(include "../../../lib/weblib.scm")

; Define Document.write procedures : write code in the document

(define (document.write msg)
  (##inline-host-statement "document.write(g_scm2host(@1@));" msg))

         
; Main function
(define (main) 
  (document.write "<h1>Hello World !</h1>")
)

; launch the main function
(main)