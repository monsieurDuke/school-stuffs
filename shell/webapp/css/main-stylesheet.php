<?php
	header("Content-type: text/css; charset: UTF-8");
?>
:root {
	color: #289E92;
	font-family: Ubuntu, sans-serif;
	font-size: 20px;
	letter-spacing: 2.5px;	
}
html, body {
	padding: 0;
	margin: 0;
	width: auto;
	height: 100%;
	box-sizing: border-box;
	overflow: hidden;
}
body {
	background-image: url("../image/memphis-colorful.png");
	display: flex;
	flex-direction: column;
	transition: 0.3s;
	min-height: 100%;
	margin: 0 auto -50px;
}
.head-logo img {
	text-align: center;	
	min-width: auto;
	max-width: 30em;
	opacity: 0.7;
	display: flex;
	margin-top: 5em;
	margin-left: auto;
	margin-right: auto;	
	transition: 0.3s;
}
.head-logo img:hover {
	transform: scale(1.03);
	opacity: 1;
	cursor: pointer;
}
.nav-topbar {
	display: none;
}
.nav-sidebar {
	background: linear-gradient(to right, rgba(24,79,192,0.5), rgba(60,56,191,0.4));	
	float: left;
	width: 4em;
	height: auto;
	margin-top: 2.5em;
	margin-left: 1.5em;
	margin-right: 1.5em;	
	overflow: hidden;
	position: fixed;
	border-radius: 1.5em;		
	box-shadow: 0 0.2em 0.6em rgba(0,0,0,0.3);	
}
.nav-sidebar li {
	list-style: none;	
	margin-left: -1.85rem;
	align-items: center;
	margin-bottom: 0.7rem;
}
.nav-sidebar li:first-child {
	margin-top: 0.7rem;
}
.nav-sidebar ul {
	margin-top: 0.5em;
	margin-bottom: 0.5em;
	align-items: center;
	display: flex;
	flex-direction: column;
}
.nav-sidebar .nav-item {
	text-decoration: none;	
}
.nav-sidebar .nav-item i {
	color: #FFFFFF;
	opacity: 0.8;
	display: block;
	transition: 0.4s all;
	width: 100%;
	font-size: 1.7em;
}
.nav-item i:hover {
	transform: scale(1.35) rotate(0.02deg);
	transition: 0.4s;
	cursor: pointer;
}
.main-content {
	flex: 1 0 auto;
	max-height: auto;
}
.foot-logo {
	letter-spacing: 1px;
	text-align: center;
	padding: 1em;
	background: rgba(24,79,192,0.7);
	font-size: 0.6em;
	color: #FFFFFF;	
	flex-shrink: 0;
}
.foot-logo a {
	text-decoration: none;
	color: #C6FFDD;
}

@media screen and (max-width: 1000px) , screen and (max-height: 600px) {
	.head-logo img {
		max-width: 20em;
	}	
	.nav-sidebar {	
		display: none;
	}
	.nav-topbar {
		display: inline;
		background: linear-gradient(to right, rgba(24,79,192,0.5), rgba(60,56,191,0.4));	
		width: 100%;
		height: 2.5em;
		overflow: hidden;
		position: fixed;
		box-shadow: 0 0.2em 0.6em rgba(0,0,0,0.3);
		transition: 0.4s;
		margin-left: auto;
		margin-right: auto;	
		text-align: center;
	}
	.nav-topbar li {
		display: inline;
		align-items: center;
	}
	.nav-topbar ul {
		padding: 0;
		margin-top: 0.6em;
	}
	.nav-topbar .nav-item {
		text-decoration: none;	
	}
	.nav-topbar .nav-item i {
		color: #FFFFFF;
		opacity: 0.8;
		display: inline;
		transition: 0.4s all;
		width: 100%;
		font-size: 1.4em;
		margin-right: 0.3em;
		margin-left: 0.3em;
	}
}

/* cari tau sticky foooter */