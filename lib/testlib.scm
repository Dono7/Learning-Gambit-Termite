


(define (log msg)
  (##inline-host-statement "console.log(g_scm2host(@1@));" msg))

(define (DOM-log element)
  (##inline-host-statement "console.log(@1@);" element))

(define (log-toStr variable)
  (##inline-host-statement "console.log(g_scm2host(@1@));" variable))
