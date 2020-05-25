function poserAnimation(numcarte){
	$('#mycards .ca:nth-child('+numcarte+')').css("opacity",0);
	switch(numcarte) {
		case 1: $('#mycards .ca:nth-child('+numcarte+')').css("transform","translate(150px,-150px)");break;
		case 2: $('#mycards .ca:nth-child('+numcarte+')').css("transform","translate(100px,-150px)");break;
		case 3: $('#mycards .ca:nth-child('+numcarte+')').css("transform","translate(50px,-150px)");break;
		case 4: $('#mycards .ca:nth-child('+numcarte+')').css("transform","translate(0px,-150px)");break;
		case 5: $('#mycards .ca:nth-child('+numcarte+')').css("transform","translate(-50px,-150px)");break;
		case 6: $('#mycards .ca:nth-child('+numcarte+')').css("transform","translate(-100px,-150px)");break;
		case 7: $('#mycards .ca:nth-child('+numcarte+')').css("transform","translate(-150px,-150px)");break;
	}
}