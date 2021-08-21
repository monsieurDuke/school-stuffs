function generateUID() {
	let concat = "";
	for (var i=0; i<5; i++) {
		let r = (Math.random() + 1).toString(36).substring(7);
		concat += r;
		if (i<4) {concat += "-"}
	}
	var text = document.getElementsByClassName("text")[0].innerHTML = concat.toUpperCase()
}