

(define (asc-list from to)
   (if (> from to)
      '()
      (cons from (asc-list (+ from 1) to))))

(define (make-deck) 
  (asc-list 1 54))



;(define game 
;	(list
;		(list)
;		(make-deck)
;		(list)))

;(define deck (cadr game))
;(define players (car game))
;(define discard (caddr game))

(define deck (make-deck))
(define players (list))
(define discard (list))







(define (list-set! list k val)
    (if (zero? k)
        (set-car! list val)
        (list-set! (cdr list) (- k 1) val)))
(define (deck-set!-1 list k val)
	(list-set! list (- k 1) val))
;(deck-set!-1 deck 5 10) 
(define (switch-deck list index1 index2)
	(if (< index1 index2)
		(let (  (tmp (list-ref list (- index2 1)))
				(index1 (- index1 1))
				(index2 (- index2 1)) )
			(list-set! list index2 (list-ref list index1))
			(list-set! list index1 tmp))))
(define (shuffle list)
	(if (> (length list) 2)
		(begin
			(switch-deck list 1 (random-integer (+ 1 (length list))))
			(shuffle (cdr list)) )))
(define (set-cadr! list newvalue)
	(set-car! (cdr list) newvalue))


(define index '())
(define (store-index num list) 
	(if (null? list)
		(set! index (cons num (cons 1 index)))
		(if (eqv? num (car list))
			(set-cadr! list (+ (cadr list) 1) )
			(store-index num (cddr list)))))
(define (find-and-store number list #!optional (i 0))
	(if (eqv? (car list) number)
		(store-index i index)
		(find-and-store number (cdr list) (+ i 1))))
(define (stats-shuffle n i)
	(if (positive? n)
		(begin
			(set-car! (cdr game) (make-deck))
			(shuffle deck)
			(find-and-store i deck)
			(stats-shuffle (- n 1) i))
		index))


(define (print-stats list)
	(if (not (null? list))
		(begin 
			(println (string-append (number->string (car list)) "," (number->string (cadr list))))
			(print-stats (cddr list)))))
(define (pl-init-example)
	(list
		(list (list 42 16 5 8 46 34 39) "Dony" '(4 30) 11)
		(list (list 31 7) "Delphy" '(14 56) 14)
		(list (list 48 19 38 26) "Dams" '(34 27) 27)
		(list (list 2 41 33 22 ) "Brybry" '(45 27) 8)
		(list (list 42 16 5 8 46 47) "Jess" '(86 27) 16)
		))

(define (pl-add! name)
	(set-car! game (cons (list '() name '(0 0) ) players)))
(define (pl-howmany?)
	(length players))
(define (pl-player? name)
	(pl-byName-aux name players))
(define (pl-byName-aux name list)
	(if (not (null? list))
		(if (string=? (cadar list) name)
			(car list)
			(pl-byName-aux name (cdr list)))
		'() ))
(define (pl-hand? name)
	(let ((p (pl-player? name)))
		(if (not (null? p))
			(car p))))
(define (pl-scores? name)
	(let ((p (pl-player? name)))
		(if (not (null? p))
			(caddr p))))
(define (pl-score? name)
	(let ((p (pl-player? name)))
		(if (not (null? p))
			(car (caddr p)))))
(define (pl-total? name)
	(let ((p (pl-player? name)))
		(if (not (null? p))
			(cadr (caddr p)))))
(define (pl-changeName! playername newname)
	(let ((p (pl-player? playername)))
		(if (not (null? p))
			(set-car! (cdr p) newname))))

(define (pl-index? name)
	(pl-index-aux players name 1))
(define (pl-index-aux pllist name i)
	(if (not (null? pllist))
		(begin
			(if (string=? name (name? (car pllist)))
				i
				(pl-index-aux (cdr pllist) name (+ i 1))
			))
		-1))
(define (pl-player-from-index i)
	(if (not (eqv? i -1))
		(pl-player-from-index-aux i players)))
(define (pl-player-from-index-aux i pllist)
	(if (eqv? i 1)
		(car pllist)
		(pl-player-from-index-aux (- i 1) (cdr pllist))))

(define (pl-addScore! name int)
	(let ((p (pl-player? name)))
		(if (not (null? p))
				(set-car! (caddr p) (+ int (caaddr p))))))
(define (pl-score! name newscore)
	(let ((p (pl-player? name)))
		(if (not (null? p))
			(set-car! (caddr p) newscore))))
(define (pl-scores! name scorepair)
	(let ((p (pl-player? name)))
		(if (not (null? p))
			(set-car! (cddr p) scorepair))))

(define (pl-numicon! name newnum)
	(let ((p (pl-player? name)))
		(if (not (null? p))
			(set-car! (cdddr p) newnum))))
(define (pl-print p)
	(println (name? p) "\t" (score? p) ":" (total? p) "\t[ " (hand->string (hand? p)) "]"))
(define (pl-print-all)
	(pl-print-all-aux players))
(define (pl-print-all-aux list)
	(if (not (null? list))
		(begin 
			(pl-print (car list))
			(pl-print-all-aux (cdr list)))))
(define (name? p)
	(cadr p))
(define (score? p)
	(caaddr p))
(define (total? p)
	(cadr (caddr p)))
(define (numicon? p)
	(cadddr p))
(define (hand? p)
	(car p))
(define (hand->string h)
	(if (not (null? h))
		(string-append (number->string (car h)) " " (hand->string (cdr h)))
		""))




(define (document.write html)
  (##inline-host-statement "document.write(g_scm2host(@1@));" html))

;(document.write "<h1>Hello world!</h1>")

(define (clear-id id)
	(##inline-host-statement "document.getElementById(g_scm2host(@1@)).innerHTML = \"\";" id))

(define (toggle-id id)
	(##inline-host-statement "$('#'+g_scm2host(@1@)).toggle();" id))


(define (n-showcard n)                         
	(if (> n 0)
		(string-append "<div class=\"showcard\"></div>" (n-showcard (- n 1)))
		""))

(define (pl->html-str name score hand numicon)
	(string-append "<div class=\"card-container card-shadow\">
        <div class=\"eventails\">"
        	(n-showcard (length hand))
        "</div>
        <div class=\"shapes\">
          <div class=\"circle1\"></div>
          <div class=\"circle2\"></div>
          <div class=\"square1\"></div>
          <div class=\"square2\"></div>
        </div>
        <div class=\"player-card\">
          <div class=\"icon player-icon-" (number->string numicon) "\"></div>
          <p class=\"player-infos\">
            <span class=\"name\">" name "</span>
          </p>
        </div>
        <p class=\"score-bar\">
          <span class=\"score\">" (number->string score) "</span>
        </p>
      </div>"))

(define (pl-display name score hand numicon)
	(##inline-host-statement "$('#players-container').append(g_scm2host(@1@));" (pl->html-str name score hand numicon)))

(define (pl-display-me me)
	(begin
		(##inline-host-statement "$('#myname').html(g_scm2host(@1@));" (name? me))
		(##inline-host-statement "$('#myscore').html('<span>'+g_scm2host(@1@)+'</span>');" (number->string (score? me)))
		(##inline-host-statement "$('#myicon').attr('class',g_scm2host(@1@));" (string-append "player-icon-" (number->string (numicon? me))))
		(clear-id "mycards")
		(display-myhand (hand? me))
		))
;(pl-display-me "Me" 42 '(53 1 20 13 42) 21)

(define (display-myhand h)
	(if (not (null? h))
		(begin 
			(##inline-host-statement "$('#mycards').append(g_scm2host(@1@));" (string-append "<div class=\"ca ca-simp ca" (number->string (car h)) "\"></div>"))
			(display-myhand (cdr h)))))


(define (print-deck-n-cards n)
	(##inline-host-statement "for(var i=0; i < g_scm2host(@1@) ; i++){ document.getElementById(\"pioche\").innerHTML += '<div class=\"ca ca-simp ca55\"></div>' ;} " n))

(define (print-discard #!optional (dis (reverse discard)))
	(if (not (null? dis))
		(begin
			(##inline-host-statement "$('#discard').append('<div class=\"ca ca-simp '+g_scm2host(@1@)+'\"></div>')" (string-append "ca" (number->string (car dis))))
			(print-discard (cdr dis)) )))

(define (update-table)
	(begin
		(clear-id "pioche")
		(print-deck-n-cards (length deck))
		(clear-id "discard")
		(print-discard)))

(define (update-players)
	(begin
		(clear-id "players-container")
		(pl-display-me (car players))
		(pl-display-aux (cdr players))
		(update-table)
		;(display-table-deck-onecard)
		;(clear-id "pioche")
		;(display-table-deck)
		;(print-deck-n-cards (length deck))
		))


(define (pl-display-aux pllist)
	(if (not (null? pllist))
		(begin
			(pl-display (name? (car pllist)) (score? (car pllist)) (hand? (car pllist)) (numicon? (car pllist)))
			(pl-display-aux (cdr pllist)))))





(define (mycard-append div)
	(##inline-host-statement "document.getElementById(\"mycards\").innerHTML += (g_scm2host(@1@));" div))

(define (mycard num)
	(mycard-append (##inline-host-expression "g_host2scm(\"<button class=\\\"ca ca-simp ca\"+g_scm2host(@1@)+\"\\\">\"+\"</button>\")" num) ) )


(define (pl-display-myhand hand)
	(if (not (null? hand))
		(begin 
			(mycard (number->string (car hand)))
			(pl-display-myhand (cdr hand)))))

;(pl-display-myhand (list 53 1 21 13 42))


(set! players (pl-init-example))

#|
(define (game-deal nbcartes)
	(cond (>= nbcartes 0)
		(game-deal-one)))

(define (game-deal-one)
	(game-deal-aux players))

(define (game-deal-aux playerslist)
	(cond (not (null? playerslist))
		(
			(set-car! (car playerslist) (cons (car deck) (car playerslist)))
			(set! deck (cdr deck))
			(game-deal-aux (cdr playerslist)))))

|#
(define (id-to-value-int id)
	(##inline-host-expression "g_host2scm(+document.getElementById(g_scm2host(@1@)).value)" id))
(define (id-to-value-str id)
	(##inline-host-expression "g_host2scm(document.getElementById(g_scm2host(@1@)).value)" id))

(define (update-from-player-form)
	(let ( (numplayer (id-to-value-int "numjoueur")) (name (id-to-value-str "name1")) (score (id-to-value-int "score1")) (numicon (id-to-value-int "numicon1")) )
		(begin 
			(update-player-with-infos players numplayer name score numicon)
			(update-players))))


(define (update-player-with-infos playerlist num name score icon)
	(let ((p (pl-player-from-index num)))
		(begin
			(pl-changeName! (name? p) name)
			(pl-score! (name? p) score)
			(pl-numicon! (name? p) icon)
			(update-players))))

;(define (button-click-set! proc)
;  (##inline-host-statement "updatePlayers = g_scm2host(@1@);" proc))

(define (close-start)
	(begin
		(toggle-id "players-form-section")
		(toggle-id "table")))

;(button-click-set! update-players)
(##inline-host-statement "closeAndStart = g_scm2host(@1@);" close-start )
(##inline-host-statement "updatePlayers = g_scm2host(@1@);" update-from-player-form )
(##inline-host-statement "resetCardsAndUpdate = g_scm2host(@1@);" (lambda () (begin (reset-cards) (update-players))) )
(##inline-host-statement "dealCards = g_scm2host(@1@);" (lambda () (begin (game-deal) (update-players))) )

(clear-id "warning")

;(document.write "<button class='ml-5' onclick=\"updatePlayers()\">Update</button>")
(document.write "<button class='ml-5' onclick=\"resetCardsAndUpdate()\">Reset Cards (et melanger)</button>")
(document.write "<button class='ml-5' onclick=\"dealCards()\">Distribuer</button>")
(update-players)


(define (reset-cards) 
	(begin
		(set! discard (list))
		(set! deck (make-deck))
		(shuffle deck)
		(reset-hands players)))

(define (reset-hands pllist)
	(if (not (null? pllist))
		(begin 
			(set-car! (car pllist) (list))
			(reset-hands (cdr pllist)))))

; FAIRE FONCTION DE DEAL POUR DISTRIBUER LES CARTES
(define (game-deal)
	(begin
		(deal-one)
		(deal-one)
		(deal-one)
		(deal-one)
		(deal-one)
		(deal-one)
		(deal-one)))

(define (deal-one #!optional (pllist players))
	(if (not (null? pllist))
		(let ( (first (car deck)))
			(begin
				(set-car! (car pllist) (cons first (caar pllist)))
				(remove-first-card)
				(deal-one (cdr pllist))))))

(define (remove-first-card)
	(set! deck (cdr deck)))

(define (show-deck)
	(list (car deck) (cadr deck) (caddr deck) (cadddr deck) (cadr (cdddr deck)) (caddr (cdddr deck)) (cadddr (cdddr deck)) ))









#| "Operator is not a PROCEDURE (#!void)" dès qu'on appelle l'affichage du deck, pour une raison inconnue... ???

(define (display-table-deck #!optional (n (length deck)) )
	(if (> n 0)
		(begin
			(display-table-deck-onecard)
			(display-table-deck (- n 1)))))

(define (display-table-deck-onecard)
	;(begin
		;(##inline-host-statement "$('#pioche').append('<div class=\"ca ca-simp ca55\"></div>');")
		;(##inline-host-statement "$('#pioche')[0].innerHTML += '<div class=\"ca ca-simp ca55\"></div>';" )
		;(##inline-host-statement "$('#pioche').html(g_scm2host(@1@));" "<div class=\"ca ca-simp ca55\"></div>")))
	(##inline-host-statement "document.getElementById(g_scm2host(@1@)).innerHTML = \"\";" "mycards"))

(define (display-onecard)
	(##inline-host-statement "$('#pioche')[0].innerHTML += '<div class=\"ca ca-simp ca55\"></div>';"))

(define (update-table)
	(begin
		(clear-id "pioche")
		(display-table-deck)))

|#


(define (move-to-discard c)
	(set! discard (cons (list-ref (hand? (car players)) c) discard)))

(define (rmv-from-list! l i)
	(set! l (rmv-from-list l i)))

(define (rmv-from-list l i)
	(if (not (null? l))
		(if (eqv? i 1)
			(cdr l)
			(cons (car l) (rmv-from-list (cdr l) (- i 1))))))

(define (poser)
	(let ((c ( - (id-to-value-int "putthis") 1)))
		(begin
			(move-to-discard c)
			(set-car! (car players) (rmv-from-list (caar players) (+ c 1)))
			(update-players))))

(define (piocher)
	(begin
		(set-car! (car players) (reverse (cons (car deck) (reverse (caar players)))))
		(set! deck (cdr deck))))

(define (recuperer)
	(begin
		(if (> (length discard) 0)
			(set-car! (car players) (reverse (cons (car discard) (reverse (caar players)))))
			(set! deck (cdr deck)))))

(define (animation-poser)
	(let ((num (id-to-value-int "putthis")))
		(##inline-host-statement "poserAnimation(g_scm2host(@1@));" num)))


(define (poser-et-piocher)
	(begin
		(poser)
		(piocher)
		(update-players)))

(define (poser-et-recup)
	(begin
		(recuperer)
		(poser)
		(update-players)))



(define (simul-someone-play name)
	(if (not (null? deck))
		(let ((p (pl-player? name)))
			(begin
				(set! discard (cons (car (hand? p)) discard))
				(set-car! p (cons (car deck) (cdar p)))
				(remove-first-card)))))

(define (simul-everyenemy-play #!optional (pllist (cdr players)))
	(if (not (null? pllist))
		(begin
			(simul-someone-play (name? (car pllist)))
			(simul-everyenemy-play (cdr pllist)))
		(update-players)))


; Fonction pas utile au final, car intégré dans simul-some-play
(define (pl-add-carte name valcarte #!optional (pllist players))
	(if (not (null? pllist))
		(let ((p (car pllist)))
			(if (string=? (name? p) name)
				(set-car! p (cons valcarte (hand? p)))
				(pl-add-carte name valcarte (cdr pllist))))))

(define (melanger-les-deck)
	(begin
		(set! deck (append deck discard))
		(set! discard (list))
		(shuffle deck)
		(update-players)))


(##inline-host-statement "poserAnimationScm = g_scm2host(@1@);" animation-poser )
(##inline-host-statement "poser = g_scm2host(@1@);" poser-et-piocher )
(##inline-host-statement "recuperer = g_scm2host(@1@);" poser-et-recup )
(##inline-host-statement "simulTour = g_scm2host(@1@);" simul-everyenemy-play )
(##inline-host-statement "melangerDecks = g_scm2host(@1@);" melanger-les-deck )



(define (set-game-ready)
	(begin
		(close-start)
		(reset-cards)
		(game-deal)
		(update-players)))

;(set-game-ready)
(##repl-debug-main)
;gsc -target js -exe -o game.js game.scm