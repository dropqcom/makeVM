<?php
	echo '<html>';
	echo '<div class="menu">';
		include("menu.php");
	echo '</div>';

	echo '</br>';
	echo 'Hello';
	echo '<body>
		<a href="index.php?page=contact.php"><button>Show Contact</button></a>
		</body>
		</html>
		';
	echo '</br>';
	$page = $_GET['page'];
	include($page);
	echo '</br>';

	echo '<div class=footer>';
		include("footer.php");
	echo '</div>';
?>



