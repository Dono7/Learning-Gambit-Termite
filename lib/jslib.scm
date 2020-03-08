; This library needs weblib to work


        ; DOM FUNCTIONS

(define (DOM-getById id)
    (##inline-host-expression "(document.getElementById(g_scm2host(@1@)))" id))

(define (DOM-body)
  (##inline-host-expression "body"))

(define (DOM-body-scm)
  (##inline-host-expression "g_host2scm(body)"))

(define (DOM-log element)
   (##inline-host-statement "console.log(@1@);" element))

; Call the JavaScript Alert function
(define (DOM-alert msg)
  (##inline-host-statement "alert(g_scm2host(@1@));" msg))

(define (DOM-rmv element)
    (##inline-host-statement "@1@.remove();" element))

(define (DOM-append-child parent newchild)
    (##inline-host-statement "@1@.appendChild(@2@);" parent newchild))


; List of type dependent log functions (some types use the same form)

(define (log-str v)
  (##inline-host-statement "console.log(g_scm2host(@1@));" v))

(define (log-int i)
  (##inline-host-statement "console.log(g_scm2host(@1@));" i))

(define (log-bool b)
  (##inline-host-statement "console.log(@1@);" b))

(define (log-char c)
  (##inline-host-statement "console.log( String.fromCharCode(@1@.code) );" c))

(define (log-real f)
  (##inline-host-statement "console.log(g_scm2host(@1@));" f))

(define (log-rat r)
  (##inline-host-statement "console.log( @1@.num+\"/\"+@1@.den );" r))

(define (log-comp c)
  (if (positive? (imag-part c)) ; The + sign need to be displayed, the - sign is include
    (##inline-host-statement "console.log( @1@.real+\"+\"+@1@.imag+\"i\" );" c)
    (##inline-host-statement "console.log( @1@.real.toString()+@1@.imag.toString()+\"i\" );" c)))

(define (log-obj o)
  (##inline-host-statement "console.log(@1@);" o))



(define (log var)
  (if (str? var)
    (log-str var)
    (if (int? var)
      (log-int var)
      (if (float? var)
        (log-real var)
        (if (rat? var)
          (log-rat var)
          (if (char? var)
            (log-char var)
            (if (comp? var)
              (log-comp var)
              (log-obj var))))))))

; Call the JavaScript Alert function
(define (alert msg)
  (##inline-host-statement "alert(g_scm2host(@1@));" msg))


; Prepend/Append HTML at the beginning/end of the body content
(define (body-prepend msg)
  (##inline-host-statement "body.innerHTML = g_scm2host(@1@) + body.innerHTML;" msg) )

(define (body-prepend-br msg)
  (##inline-host-statement "body.innerHTML = g_scm2host(@1@) + g_scm2host(@2@) + body.innerHTML;" msg "<br/>") )

(define (body-append msg)
  (##inline-host-statement "body.innerHTML += g_scm2host(@1@);" msg) )

(define (body-append-br msg)
  (##inline-host-statement "body.innerHTML+= g_scm2host(@1@) + g_scm2host(@2@);" msg "<br/>") )



; Prepend/Append text at the beginning/end of the body content
; HTML is not supported here. See body-append to add html tags
(define (body-append-text msg)
  (##inline-host-statement "body.append(g_scm2host(@1@));" msg) )
(define (body-append-text-br msg)
  (##inline-host-statement "body.append(g_scm2host(@1@));" msg) 
  (body-append "<br/>"))



; ! It is not recommanded to use this function ! It is preferable to use body-append.
; Allows to write code in the document
(define (document.write msg)
  (##inline-host-statement "document.write(g_scm2host(@1@));" msg))


; Create tags, for exemple <p></p> (or solo-tag, for exemple <br/>)
; this function only return a string, not an DOM element
(define (tag tagname)
  (##inline-host-expression "g_host2scm(\"<\"+g_scm2host(@1@)+\"></\"+g_scm2host(@1@)+\">\")" tagname))
(define (tag-solo tagname)
  (##inline-host-expression "g_host2scm(\"<\"+g_scm2host(@1@)+\"/>\")" tagname))




