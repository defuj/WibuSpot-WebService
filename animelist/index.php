<?php
date_default_timezone_get('Asia/Jakarta');
include "config.php";

/** 
Fungsi untuk Sign In dan Sign Up
**/
if(!empty($_GET['sign'])){
	//Fungsi untuk mengecek apakah data email dan nama dikirimkan dari aplikasi ke sini atau tidak
	if(isset($_POST['email']) && isset($_POST['nama'])){
		$email = htmlentities($_POST['email']);
		$nama  = htmlentities($_POST['nama']);
		$foto  = htmlentities($_POST['foto']);
		$tanggal = date('Y-m-d h:i:s', time());
		
		//Telah diketahui bahwa data email dan nama telah diterima di sini,
		//Kemudian di cek lagi apakah data itu kosong atau tidak
		if($email != "" && $nama != ""){
			//Fungsi SQL yang dijalankan setelah mengetahui kalo data yang diterima tidak kosong,atau memiliki data
			//Kemudian SQL di bawah untuk mengecek apakah di dalam tabel accounts sudah ada data email yang sama dengan
			//yang dikirimkan ke sini
			$query = mysqli_query($connect, "SELECT * FROM accounts where email = '$email'");
			$hasil = mysqli_num_rows($query);
			//Fungsi yang dijalankan jika ternyata di dalam tabel accounts ditemukan email yang sama
			//Data ditampilkan dalam bentuk Array JSON, yang kemudian akan dibaca oleh aplikasi dan disimpan sebagai CACHE
			//Terdiri atas data email, nama, foto, dan status accounts
			//setelah menerima data ini, aplikasi langsung masuk ke halaman utama/beranda.
			if($hasil > 0){
				$response['result']= 'true' ;
				$response['msg']= 'Data ditemukan';
				$response['data'] = array();

				while ($row = mysqli_fetch_assoc($query)) {
					$data = array();
					$data['email'] = $row['email'];
					$data['nama'] = $row['name'];
					$data['foto'] = $row['photos'];
					$data['status'] = $row['status'];
					array_push($response['data'], $data);
				}
				echo json_encode($response);
			}else {
				//Fungsi ini dijalankan apabila belum ada data email yang sama di tabel accounts
				//SQL dibawah ini untuk insert data ke tabel accounts, data diambil dari data yang dikirimkan oleh aplikasi
				//yaitu data email, nama, foto
				//kemudia ditambah data tanggal dan status user.
				
				//Data ditampilkan dalam bentuk Array JSON, yang kemudian akan dibaca oleh aplikasi dan disimpan sebagai CACHE
				//Terdiri atas data email, nama, foto, dan status accounts
				//setelah menerima data ini, aplikasi langsung masuk ke halaman utama/beranda.
				$query = mysqli_query($connect, "INSERT INTO accounts values('$email','$nama','$foto','$tanggal','user')");
				$query = mysqli_query($connect, "SELECT * FROM accounts where email = '$email'");
				$response['result']= 'true' ;
				$response['msg']= 'Data ditemukan';
				$response['data'] = array();

				while ($row = mysqli_fetch_assoc($query)) {
					$data = array();
					$data['email'] = $row['email'];
					$data['nama'] = $row['name'];
					$data['foto'] = $row['photos'];
					$data['status'] = $row['status'];
					array_push($response['data'], $data);
		 		}
		 		echo json_encode($response);
			}
		}else{
			echo "Data Email dan Nama Kosong";
		}
	}else{
		echo "Data Tidak Terkirim";
	}
}

//Lokasi di Aplikasi : Beranda, bagian paling atas, Bagian SEDANG TREND
elseif(!empty($_GET['popular'])){
	//SQL ini untuk menampilkan data dari tabel anime yang dijoin dengan tabel studios, 
	//dua tabel itu dijoin karena untuk meenampilkan data nama studio berbarengan dengan data anime.
	//
	//SQL ini menampilkan 10 data berdasarkan field VIEW terbesar.
	$query = mysqli_query($connect, "SELECT * FROM anime inner join studios on anime.id_studio = studios.id_studio order by view desc LIMIT 10");
	$response['result']= 'true' ;
	$response['msg']= 'Data ditemukan';
	$response['data'] = array();

	//Syntax PHP untuk menampilkan semua datanya
	//dengan mengambil data :
	//1. id_anime
	//2. title
	//3. studio
	//4. sinopsis
	//5. type
	//6. episodes
	//7. status
	//8. release_date
	//9. premiered & premiered_year
	//10. source
	//11. cover
	//12. rate
	while ($row = mysqli_fetch_assoc($query)) {
		$data = array();
		$id = $row['id_anime'];
		$data['id'] = $row['id_anime'];
		$data['judul'] = $row['title'];
		$data['studio'] = $row['studio'];
		$data['sinopsis'] = htmlentities($row['synopsis']);
		$data['type'] = $row['type'];
		$data['eps'] = $row['episodes'];
		$data['status'] = $row['status'];
		$data['release_date'] = $row['release_date'];
		$data['premiered'] = $row['premiered'].' '.$row['premiered_year'];
		$data['source'] = $row['source'];
		$data['score'] = $row['score'];
		$data['cover'] = $row['cover'];
		$data['rank'] = '';
		$id = $row['id_anime'];
		
		//SQL untuk menampikan total score dari anime,
		//data diambil dengan :
		//[pertama] SELECT SUM() --> fungsi untuk menjulahkan
		//[kedua] (SELECT SUM(score) FROM score WHERE id_anime='$id') --> untuk menjulahkan semua score yang ada di tabel score dyang memiliki id_anime tertentu
		//[ketiga] (SELECT COUNT(score) FROM score WHERE id_anime='$id') --> untuk mengetahui jumlah score yang ada di tabel score dengan id_anime tertentu
		//
		//jadi secara tertulis seperti ini :
		//SELECT SUM([kedua]/[ketiga]);
		$query2 = mysqli_query($connect, "SELECT SUM((SELECT SUM(score) FROM score WHERE id_anime='$id')/(SELECT COUNT(score) FROM score WHERE id_anime='$id')) as rate");
		$data1 = mysqli_fetch_assoc($query2);
		
		//untuk cek apakah jumlah score = null atau tidak, 
		//karena jika tidak ada data score yang sesuai dengan data id_anime tertentu, data yang di tampilkan adalah null, bukan angka
		if($data1['rate'] == null){
			//data dimanipulasi menjadi tipe string dengan nilai 0,0, karena data diketahui bernilai null
			$data['rate'] = "0,0";
		}else{
			//data tidak null, karena angka dibelakang koma tidak dibatasi, maka dengan ini dibatasi menjadi 2 angka saja.
			$data['rate'] = number_format($data1['rate'],2);
		}

		array_push($response['data'], $data);
	}
	echo json_encode($response);
}
//Untuk menampilkan SEMUA DATA anime berdasarkan view terbanyak
//penjelasn koding di dalamnya sama saja dengan sebelumnya.
elseif(!empty($_GET['popularAll'])){
	$query = mysqli_query($connect, "SELECT * FROM anime inner join studios on anime.id_studio = studios.id_studio order by view desc ");
	$response['result']= 'true' ;
	$response['msg']= 'Data ditemukan';
	$response['data'] = array();

	while ($row = mysqli_fetch_assoc($query)) {
		$data = array();
		$data['id'] = $row['id_anime'];
		$data['judul'] = $row['title'];
		$data['studio'] = $row['studio'];
		$data['sinopsis'] = htmlentities($row['synopsis']);
		$data['type'] = $row['type'];
		$data['eps'] = $row['episodes'];
		$data['status'] = $row['status'];
		$data['release_date'] = $row['release_date'];
		$data['premiered'] = $row['premiered'].' '.$row['premiered_year'];
		$data['source'] = $row['source'];
		$data['score'] = $row['score'];
		$data['cover'] = $row['cover'];
		$data['rank'] = '';
		$id = $row['id_anime'];
		$query2 = mysqli_query($connect, "SELECT SUM((SELECT SUM(score) FROM score WHERE id_anime='$id')/(SELECT COUNT(score) FROM score WHERE id_anime='$id')) as rate");
		$data1 = mysqli_fetch_assoc($query2);
		if($data1['rate'] == null){
			$data['rate'] = "0,0";
		}else{
			$data['rate'] = number_format($data1['rate'],2);
		}

		array_push($response['data'], $data);
	}
	echo json_encode($response);
}
//Lokasi di Aplikasi : Beranda, bagian tengah, Bagian SEDANG TAYANG
//penjelasn koding di dalamnya sama saja dengan sebelumnya.
elseif(!empty($_GET['airing'])){
	//hanya menampilkan 4 data
	// berdasarkan data anime dengan status : Currently Airing
	$query = mysqli_query($connect, "SELECT * FROM anime inner join studios on anime.id_studio = studios.id_studio where status = 'Currently Airing' LIMIT 4");
	$response['result']= 'true' ;
	$response['msg']= 'Data ditemukan';
	$response['data'] = array();

	while ($row = mysqli_fetch_assoc($query)) {
		$data = array();
		$data['id'] = $row['id_anime'];
		$data['judul'] = $row['title'];
		$data['studio'] = $row['studio'];
		$data['sinopsis'] = htmlentities($row['synopsis']);
		$data['type'] = $row['type'];
		$data['eps'] = $row['episodes'];
		$data['status'] = $row['status'];
		$data['release_date'] = $row['release_date'];
		$data['premiered'] = $row['premiered']." ".$row['premiered_year'];
		$data['source'] = $row['source'];
		$data['score'] = $row['score'];
		$data['cover'] = $row['cover'];
		$data['rank'] = '';
		$id = $row['id_anime'];
		$query2 = mysqli_query($connect, "SELECT SUM((SELECT SUM(score) FROM score WHERE id_anime='$id')/(SELECT COUNT(score) FROM score WHERE id_anime='$id')) as rate");
		$data1 = mysqli_fetch_assoc($query2);
		if($data1['rate'] == null){
			$data['rate'] = "0,0";
		}else{
			$data['rate'] = number_format($data1['rate'],2);
		}

		array_push($response['data'], $data);
	}
	echo json_encode($response);
}
//Lokasi di Aplikasi : Beranda, bagian paling bawah, Bagian DIREKOMENDDASIKAN
//penjelasn koding di dalamnya sama saja dengan sebelumnya.
elseif(!empty($_GET['recomend'])){
	//berdasarkan data anime dengan status : Finished Airing
	$query = mysqli_query($connect, "SELECT * FROM anime inner join studios on anime.id_studio = studios.id_studio where status = 'Finished Airing' order by RAND() LIMIT 6");
	$response['result']= 'true' ;
	$response['msg']= 'Data ditemukan';
	$response['data'] = array();

	while ($row = mysqli_fetch_assoc($query)) {
		$data = array();
		$data['id'] = $row['id_anime'];
		$data['judul'] = $row['title'];
		$data['studio'] = $row['studio'];
		$data['sinopsis'] = htmlentities($row['synopsis']);
		$data['type'] = $row['type'];
		$data['eps'] = $row['episodes'];
		$data['status'] = $row['status'];
		$data['release_date'] = $row['release_date'];
		$data['premiered'] = $row['premiered']." ".$row['premiered_year'];
		$data['source'] = $row['source'];
		$data['score'] = $row['score'];
		$data['cover'] = $row['cover'];
		$data['rank'] = '';
		$id = $row['id_anime'];
		$query2 = mysqli_query($connect, "SELECT SUM((SELECT SUM(score) FROM score WHERE id_anime='$id')/(SELECT COUNT(score) FROM score WHERE id_anime='$id')) as rate");
		$data1 = mysqli_fetch_assoc($query2);
		if($data1['rate'] == null){
			$data['rate'] = "0,0";
		}else{
			$data['rate'] = number_format($data1['rate'],2);
		}

		array_push($response['data'], $data);
	}
	echo json_encode($response);
}
//Menampilkan data anime dari tabel anime yang id_anime nya ada di tabel myfavorites, tetapi hanya data yang memiliki email tertentu di tabel myfavoritesnya,
//data emailnya di dapat dari data yang dikirim aplikasi
elseif(!empty($_GET['favorites'])){
	$email = $_POST['email'];
	$query = mysqli_query($connect, "SELECT * FROM anime INNER JOIN myfavorites ON anime.id_anime = myfavorites.id_anime INNER JOIN studios ON anime.id_studio = studios.id_studio where myfavorites.email = '$email'");
	$response['result']= 'true' ;
	$response['msg']= 'Data ditemukan';
	$response['data'] = array();

	while ($row = mysqli_fetch_assoc($query)) {
		$data = array();
		$data['id'] = $row['id_anime'];
		$data['judul'] = $row['title'];
		$data['studio'] = $row['studio'];
		$data['sinopsis'] = htmlentities($row['synopsis']);
		$data['type'] = $row['type'];
		$data['eps'] = $row['episodes'];
		$data['status'] = $row['status'];
		$data['release_date'] = $row['release_date'];
		$data['premiered'] = $row['premiered']." ".$row['premiered_year'];
		$data['source'] = $row['source'];
		$data['score'] = $row['score'];
		$data['cover'] = $row['cover'];
		$data['rank'] = '';
		$id = $row['id_anime'];
		$query2 = mysqli_query($connect, "SELECT SUM((SELECT SUM(score) FROM score WHERE id_anime='$id')/(SELECT COUNT(score) FROM score WHERE id_anime='$id')) as rate");
		$data1 = mysqli_fetch_assoc($query2);
		if($data1['rate'] == null){
			$data['rate'] = "0,0";
		}else{
			$data['rate'] = number_format($data1['rate'],2);
		}

		array_push($response['data'], $data);
	}
	echo json_encode($response);
}
//Fungsi untuk menambah/update jumlah view pada tabel anime dengan id_anime tertentu.
//setiap kali di aplikasi membuka info anime tertentu, maka aplikasi akan mengirimkan perintah untuk menjalankan fungsi ini,
elseif(!empty($_GET['view'])){
	$id = $_POST['id'];
	//view = view + 1
	//artinya :
	//field view di ganti dengan : data view yang dulu ditambah 1
	$query = mysqli_query($connect, "UPDATE anime SET view = view + 1 WHERE id_anime = '$id' ");
}
//Fungsi untuk mencek apakah anime dengan id_anime tertentu sudah difavoritkan atau belum.
//di aplikasi ada di halaman info anime
elseif(!empty($_GET['cekAnimeFavorite'])){
	$id = $_POST['id'];
	$email = $_POST['email'];
	//cek ke tabel myfavorites
	$query = mysqli_query($connect, "SELECT COUNT(email) as jml FROM myfavorites WHERE email = '$email' && id_anime='$id'");
	$data = mysqli_fetch_assoc($query);
	//jika ternyata sudah difavoritkan
	if($data['jml']>0){
		//menampikan data YA, yang kemudian di aplikasi akan dibaca dan diproses dengan mengubah icon bookmark pada halaman info anime jadi hijau
		$response['msg']= 'YA';
		echo json_encode($response);
	}else{
		//menampikan data TIDAK, yang kemudian di aplikasi akan dibaca dan diproses dengan mengubah icon bookmark pada halaman info anime jadi abu
		$response['msg']= 'TIDAK';
		echo json_encode($response);
	}
}
//Fungsi untuk memfavorikan anime
elseif(!empty($_GET['favoritkan'])){
	$id = $_POST['id'];
	$email = $_POST['email'];
	
	//memeriksa ke tabel myfavorites apakah sudah ada data email kita dan id_anime yang akan difavoritkan
	$query = mysqli_query($connect, "SELECT COUNT(email) as jml FROM myfavorites WHERE email = '$email' && id_anime='$id'");
	$data = mysqli_fetch_assoc($query);
	//jika ternyata sudah ada, 
	if($data['jml']>0){
		//maka data itu akan dihapus, atau di unfavorit
		$query = mysqli_query($connect, "DELETE FROM myfavorites WHERE email = '$email' && id_anime='$id'");

		$response['msg']= 'del';
		echo json_encode($response);
	}else{
		//sebaliknya dari di atas
		$query = mysqli_query($connect, "INSERT INTO myfavorites values('$email','$id')");

		$response['msg']= 'ins';
		echo json_encode($response);
	}
}
//Fungsi untuk melakukan pencarian
//setelah selesai mengetik di kolom pencarian, aplikasi apakan mengirim perintah untuk menjalankan fungsi ini
elseif(!empty($_GET['cari'])){
	$req = $_POST['request'];
	$query = mysqli_query($connect, "SELECT DISTINCT * FROM anime INNER JOIN studios ON anime.id_studio = studios.id_studio where anime.title like '%$req%'");
	$response['result']= 'true' ;
	$response['msg']= 'Data ditemukan';
	$response['data'] = array();

	while ($row = mysqli_fetch_assoc($query)) {
		$data = array();
		$data['id'] = $row['id_anime'];
		$data['judul'] = $row['title'];
		$data['studio'] = $row['studio'];
		$data['sinopsis'] = htmlentities($row['synopsis']);
		$data['type'] = $row['type'];
		$data['eps'] = $row['episodes'];
		$data['status'] = $row['status'];
		$data['release_date'] = $row['release_date'];
		$data['premiered'] = $row['premiered']." ".$row['premiered_year'];
		$data['source'] = $row['source'];
		$data['score'] = $row['score'];
		$data['cover'] = $row['cover'];
		$data['rank'] = '';
		$id = $row['id_anime'];
		$query2 = mysqli_query($connect, "SELECT SUM((SELECT SUM(score) FROM score WHERE id_anime='$id')/(SELECT COUNT(score) FROM score WHERE id_anime='$id')) as rate");
		$data1 = mysqli_fetch_assoc($query2);
		if($data1['rate'] == null){
			$data['rate'] = "0,0";
		}else{
			$data['rate'] = number_format($data1['rate'],2);
		}

		array_push($response['data'], $data);
	}
	echo json_encode($response);
}elseif(!empty($_GET['currently-airing'])){
	$query = mysqli_query($connect, "SELECT * FROM anime INNER JOIN studios ON anime.id_studio = studios.id_studio where status = 'Currently Airing'");
	$response['result']= 'true' ;
	$response['msg']= 'Data ditemukan';
	$response['data'] = array();

	while ($row = mysqli_fetch_assoc($query)) {
		$data = array();
		$id = $row['id_anime'];
		$data['id'] = $row['id_anime'];
		$data['judul'] = $row['title'];
		$data['studio'] = $row['studio'];
		$data['sinopsis'] = htmlentities($row['synopsis']);
		$data['type'] = $row['type'];
		$data['eps'] = $row['episodes'];
		$data['status'] = $row['status'];
		$data['release_date'] = $row['release_date'];
		$data['premiered'] = $row['premiered']." ".$row['premiered_year'];
		$data['source'] = $row['source'];
		$data['score'] = $row['score'];
		$data['cover'] = $row['cover'];
		$data['rank'] = '';
		$id = $row['id_anime'];
		$query2 = mysqli_query($connect, "SELECT SUM((SELECT SUM(score) FROM score WHERE id_anime='$id')/(SELECT COUNT(score) FROM score WHERE id_anime='$id')) as rate");
		$data1 = mysqli_fetch_assoc($query2);
		if($data1['rate'] == null){
			$data['rate'] = "0,0";
		}else{
			$data['rate'] = number_format($data1['rate'],2);
		}

		array_push($response['data'], $data);
	}
	echo json_encode($response);
}elseif(!empty($_GET['finished'])){
	$query = mysqli_query($connect, "SELECT * FROM anime INNER JOIN studios ON anime.id_studio = studios.id_studio where anime.status = 'Finished Airing'");
	$response['result']= 'true' ;
	$response['msg']= 'Data ditemukan';
	$response['data'] = array();

	while ($row = mysqli_fetch_assoc($query)) {
		$data = array();
		$data['id'] = $row['id_anime'];
		$data['judul'] = $row['title'];
		$data['studio'] = $row['studio'];
		$data['sinopsis'] = htmlentities($row['synopsis']);
		$data['type'] = $row['type'];
		$data['eps'] = $row['episodes'];
		$data['status'] = $row['status'];
		$data['release_date'] = $row['release_date'];
		$data['premiered'] = $row['premiered']." ".$row['premiered_year'];
		$data['source'] = $row['source'];
		$data['score'] = $row['score'];
		$data['cover'] = $row['cover'];
		$data['rank'] = '';
		$id = $row['id_anime'];
		$query2 = mysqli_query($connect, "SELECT SUM((SELECT SUM(score) FROM score WHERE id_anime='$id')/(SELECT COUNT(score) FROM score WHERE id_anime='$id')) as rate");
		$data1 = mysqli_fetch_assoc($query2);
		if($data1['rate'] == null){
			$data['rate'] = "0,0";
		}else{
			$data['rate'] = number_format($data1['rate'],2);
		}

		array_push($response['data'], $data);
	}
	echo json_encode($response);
}elseif(!empty($_GET['notyet'])){
	$query = mysqli_query($connect, "SELECT * FROM anime INNER JOIN studios ON anime.id_studio = studios.id_studio where anime.status = 'Not Yet Aired'");
	$response['result']= 'true' ;
	$response['msg']= 'Data ditemukan';
	$response['data'] = array();

	while ($row = mysqli_fetch_assoc($query)) {
		$data = array();
		$data['id'] = $row['id_anime'];
		$data['judul'] = $row['title'];
		$data['studio'] = $row['studio'];
		$data['sinopsis'] = htmlentities($row['synopsis']);
		$data['type'] = $row['type'];
		$data['eps'] = $row['episodes'];
		$data['status'] = $row['status'];
		$data['release_date'] = $row['release_date'];
		$data['premiered'] = $row['premiered']." ".$row['premiered_year'];
		$data['source'] = $row['source'];
		$data['score'] = $row['score'];
		$data['cover'] = $row['cover'];
		$data['rank'] = '';
		$id = $row['id_anime'];
		$query2 = mysqli_query($connect, "SELECT SUM((SELECT SUM(score) FROM score WHERE id_anime='$id')/(SELECT COUNT(score) FROM score WHERE id_anime='$id')) as rate");
		$data1 = mysqli_fetch_assoc($query2);
		if($data1['rate'] == null){
			$data['rate'] = "0,0";
		}else{
			$data['rate'] = number_format($data1['rate'],2);
		}

		array_push($response['data'], $data);
	}
	echo json_encode($response);
}
//Untuk menampilkan data genres di Aplikasi : INfo Anime
elseif(!empty($_GET['genres'])){
	$id = $_POST['id'];
	$query = mysqli_query($connect, "SELECT * FROM genres inner join genres_on_anime ON genres.id_genres = genres_on_anime.id_genres where id_anime = '$id'");
	$response['result']= 'true' ;
	$response['msg']= 'Data ditemukan';
	$response['data'] = array();

	while ($row = mysqli_fetch_assoc($query)) {
		$data = array();
		$data['id'] = $row['id_genres'];
		$data['genres'] = $row['genres'];

		array_push($response['data'], $data);
	}
	echo json_encode($response);
}
//untuk memberi rate
elseif(!empty($_GET['rate'])){
	$id = $_POST['id'];
	$email = $_POST['email'];
	$score = $_POST['score'];
	
	//cek ke tabel score apakah sudah ada data email kita dan id_anime yang akan di rate
	$query = mysqli_query($connect, "SELECT COUNT(score) as jml FROM score WHERE id_anime = '$id' && email = '$email'");

	$response['result']= 'true' ;
	$response['data'] = array();

	//jika sudah ada, 
	$row = mysqli_fetch_assoc($query);
	if($row['jml'] > 0){
		//maka data akan diupdate, sesuai data yang diterima 
		$query = mysqli_query($connect, "UPDATE score SET score = $score WHERE email='$email' && id_anime='$id'");
		$response['msg']= 'YA';
	}else{
		//jika belum ada maka data akan di insert
		$query = mysqli_query($connect, "INSERT INTO score values('$email','$id',$score)");
		$response['msg']= 'TIDAK';
	}

	echo json_encode($response);
}elseif(!empty($_GET['cekrate'])){
	$id = $_POST['id'];
	$email = $_POST['email'];

	$query = mysqli_query($connect, "SELECT * FROM score WHERE email='$email' && id_anime='$id' LIMIT 1");

	$response['result']= 'true';
	$response['data'] = array();
	while ($row = mysqli_fetch_assoc($query)) {
		$data = array();
		$data['score'] = $row['score'];

		array_push($response['data'], $data);
	}
	echo json_encode($response);
}
//UNtuk menampilkan semua genres
elseif(!empty($_GET['genresAll'])){
	$query = mysqli_query($connect, "SELECT * FROM genres");
	$response['result']= 'true' ;
	$response['msg']= 'Data ditemukan';
	$response['data'] = array();

	while ($row = mysqli_fetch_assoc($query)) {
		$data = array();
		$data['genres'] = $row['genres'];
		array_push($response['data'], $data);
	}
	echo json_encode($response);
}
?>
