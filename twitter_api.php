<?php
include "koneksi.php";
error_reporting(E_ALL & ~E_NOTICE);
session_start();
$title = 'twitter';
require "twitteroauth/autoload.php";
$q = $_POST["q"];
use Abraham\TwitterOAuth\TwitterOAuth;

$consumerkey = "w7uUui4Gcr4XfWffNpDcf6kSP";
$consumersecret = "69rDdRRNmaXoeF6DqUHMlolNTEZtdYzM3KgLNyuEXya4G1D84H"; 
$accesstoken = "706714910147776512-PeqH9ymulArmKKcWgx45lJcB0DVIbaW"; 
$accesstokensecret = "73Sfs80gTtSsFEM3LsKP5M19cOmgW2mrX9KkjJo1hOeH2"; 
$result = array("Negatif", "Positif");
function getToken($cons_key, $cons_secret, $oauth_token, $oauth_token_secret) {
  $connection = new TwitterOAuth($cons_key, $cons_secret, $oauth_token, $oauth_token_secret);
  return $connection;
}
?>


<html>
<head>
<title>Tugas STKI | Classification Positive Negative</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<script src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<?php 
include "menu.php";
?>

<div class="container">
	<form class="form-inline" action="" method="POST" autocomplete="off" >
		<div class="row">
			<div class="col-md-12">
				  <div class="form-group">
					<label for="data">Search:</label>
					<input type="text" class="form-control input-sm" name="q" value="<?php echo $q;?>" placeholder="Masukkan Pencarian">
				  </div>
				  <button type="submit" class="btn btn-success btn-sm">Submit</button>
				  <hr>
			</div>
		</div>
	</form>
	<div>
	<?php
	if($q){
		$connection = getToken($consumerkey, $consumersecret, $accesstoken, $accesstokensecret);

		$tweets = $connection->get("statuses/user_timeline", ["include_rts"=>false, "screen_name"=>$q, "count" =>30, "tweet_mode"=>"extended"]);
			$no=1;
			foreach($tweets as $tweet){
				echo "Data ".$no++.". :<br>";
				echo $tweet->user->name."<br>";
				echo "Text ===>   ".($tweet->full_text)."<br>";
				$kata = removeStopword($tweet->full_text);
				echo "Penghapusan Stopword ===>  ".$kata."<br>";
				echo "Hasil : ".$result[getResult($kata)]."<br><br>";
			}
	} 
	?>
	
	</div>
</div>
</body>

<?php 
	function removeStopword($string){
		include "koneksi.php";
		$row = explode(" ",$string);
		$word="";
		foreach($row as $value){
			$sql = "select * from tb_stopword where status ='1' and text like '% $value %'";
			$query = mysqli_query($con, $sql);
			$jml = mysqli_num_rows($query);
			if($jml > 0 ){
				$word .= "";
			}else{
				$word .= $value." ";
			}
		}
		return $word;
	}
	
	
	//mengambil result dari data training yang di db
	function getResult($string){
		//status 0 = negatif, status 1 = positif
		$status = array(0, 1);
		include "koneksi.php";
		$row = explode(" ",$string);
		$result =[];
		foreach($status  as $valStatus){
			$inc = 0;
			$result[$valStatus]=1;
			foreach($row as $value){
				$sql = "select count(*) as total from tb_result where result ='$valStatus'";
				$query = mysqli_query($con, $sql);
				$res = mysqli_fetch_array($query);
				$x = $res["total"];
				
				$sql = "select count(*) as total from tb_result ";
				$query = mysqli_query($con, $sql);
				$res = mysqli_fetch_array($query);
				$y = $res["total"];
				
				
				$sql = "select count(*) as total from tb_result where result ='$valStatus' and text like '% $value %' ";
				$query = mysqli_query($con, $sql);
				$res = mysqli_fetch_array($query);
				$jml = $res["total"];
				
				$sql = "select count(*) as total from tb_result where text like '% $value %' ";
				$query = mysqli_query($con, $sql);
				$res = mysqli_fetch_array($query);
				$total = $res["total"];
				
				
				$sql = "select sum(wordcount(text)) as total_word from tb_result where result = '$valStatus' ";
				$query = mysqli_query($con, $sql);
				$res = mysqli_fetch_array($query);
				$wordstatus = $res['total_word'];
				
				$sql = "select sum( wordcount(text) ) as total_word from tb_result";
				$query = mysqli_query($con, $sql);
				$res = mysqli_fetch_array($query);
				$words = $res['total_word'];
				if($inc==0){
					
				$val =1;
					$val = $x/$y;
				}else{
					$val =1;
				}
				$result[$valStatus] *= $val * ( ($jml+ 1 ) / ($wordstatus + $words)  ); 
				$inc++;
			}
		}
		$b = array_keys($result, max($result));
		return $b[0];
	}
?>
</html>