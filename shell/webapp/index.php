<!DOCTYPE html>
<html>
<head>
	<title>It's Happening</title>
	<link rel="stylesheet" type="text/css" href="css/main-stylesheet.php" media="screen" />
	<link rel="icon" href="image/mama-laundry.ico">
</head>
<body>
	<div class="top-div">
		<h1>- Hello World -</h1>	
	</div>
	<div class="mid-div">
		<p>	
			<?php  
				$ip = shell_exec("cd bash/ && ./run_init.sh ip");
				$sm = shell_exec("cd bash/ && ./run_init.sh sm");					
				echo "$ip | $sm";
				echo "<br>-----------------------------";
			?>
		</p>
	</div>
</body>
</html>

<!-- input form bisab buat auto download -->