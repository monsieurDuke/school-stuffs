<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>SisaApa - Cari Makan Online</title>
		<link rel="icon" href="favicon.ico">
	</head>
	<body style="text-align: center; font-family: monospace;">
		<h1 style="font-size: 30px;">CARI MENU MAKAN SIANG MU<br>SEKARANG!</h1>
		<hr style="margin-bottom: 1em;">		
		<form method="post" style="margin-bottom: 1em;">
			<input type="text" name="search_txt" placeholder="Soto Ayam Bogor">
			<input type="submit" name="search_btn" value="Search">
			<label style="margin-left: 1em;">Urutkan:</label>
			<select name="sort_lst">
				<option value="harga termurah">Harga Termurah</option>
				<option value="harga termahal">Harga Temahal</option>
				<option value="rating">Ulasan</option>				
			</select>
		</form>
		<?php
			if (array_key_exists('search_btn', $_POST)) { total_info();search();}
			function total_info() {
				$hostname = "localhost";
				$username = "client-vm";
				$password = "clientvm1ABC";
				$dbname = "distr_system";
				$conn = new mysqli($hostname, $username, $password, $dbname);
				if ($conn->connect_error) {die("Connection failed: " . $conn->connect_error);}				
				$sql = "select count(*) as 'TOT' from menu_makanan where MAKANAN like '%" . $_POST['search_txt'] . "%'";
				$result = $conn->query($sql);

				if ($result->num_rows > 0) {
					while($row = $result->fetch_assoc()) {
						if ($_POST['search_txt'] != '') {
							echo "<em>Menampilkan " . $row["TOT"] . " data untuk '" .$_POST['search_txt'] . "'<br> berdasarkan " . $_POST['sort_lst'] . "</em>";
						} else {
							echo "<em>Menampilkan seluruh data<br> berdasarkan " . $_POST['sort_lst'] . "</em>";
						}
					}
				}

			}
			function search() {
				$hostname = "localhost";
				$username = "client-vm";
				$password = "clientvm1ABC";
				$dbname = "distr_system";
				$conn = new mysqli($hostname, $username, $password, $dbname);
				$sql = "";
				if ($conn->connect_error) {die("Connection failed: " . $conn->connect_error);}
				switch ($_POST['sort_lst']) {
					case 'harga termurah':
						$sql = "select * from menu_makanan where MAKANAN like '%" . $_POST['search_txt'] . "%' order by HARGA asc limit 15";
						break;
					case 'harga termahal':
						$sql = "select * from menu_makanan where MAKANAN like '%" . $_POST['search_txt'] . "%' order by HARGA desc limit 15";
						break;
					case 'rating':
						$sql = "select * from menu_makanan where MAKANAN like '%" . $_POST['search_txt'] . "%' order by RATING desc limit 15";
						break;
				}
				$result = $conn->query($sql);

				if ($result->num_rows > 0) {
					echo "<table style='text-align: left; margin-left: auto; margin-right: auto; margin-top: 1.5em; table-layout: fixed;'><tr><th>ID</th><th>MAKANAN</th><th>HARGA</th><th>RATING</th></tr>";
					while($row = $result->fetch_assoc()) {
						echo "<tr><td style='padding-right: 15px; width: 1em;'>" . $row["ID"] . "</td><td style='padding-right: 15px; width: 15em;'>" . $row["MAKANAN"] . "</td>";
						echo "<td style='padding-right: 15px; text-align: right; padding-right: 2em;'>" . $row["HARGA"] . "</td><td style='padding-right: 15px; text-align: right; w'><em>" . $row["RATING"] . "</em></td>";
					}					
					echo "<tr><td style='padding-right: 15px; width: 1em;'>...</td><td style='padding-right: 15px; width: 15em;'>...</td>";					
					echo "<td style='padding-right: 15px; text-align: right; padding-right: 2em;'>...</td><td style='padding-right: 15px; text-align: right; w'>...</td>";					 
					echo "</table>";
				} else {
					echo "<br><br>Makanan " . $_POST["search_txt"] . ", sedang tidak tersedia :(<br>";
					echo "Cari dengan kata kunci lain";
				}
			}			
			// harga termurah order by ... desc ketersediaan harga asc
			// harga termahal order by ... desc ketersediaan harga desc
			// rating terbaik order by ... desc ketersediaan rating desc
			// tabel: id, makanan, harga, rating, ketersediaan
		?>
	</body>
</html>
