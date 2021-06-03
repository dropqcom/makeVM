<!DOCTYPE html>
<html>
<body>
	<h1> LFI Test page </h1>
		<p> check if local file inclusion works </p>
		<p> usage: http://127.0.0.1/lfi/lfi.php?file=/../../../etc/passwd </p>
		<p> apache log poisoning see exploit.py in /lfi </p>

	<?php
		$file = $_GET['file'];
		if(isset($file))
		{
			include("$file");
		}
		else
		{
			include("index.php");
		}
	?>

</body>
</html>
