?<
$servername = "localhost";
$database = "id21265920_ferreteria";
$username = "id21265920_jiveto77"
$password = "Jiveto09091977$";

//mysqli (host, usuario, contraseña, nombre_bd)
$mysqli = new mysqli(servername, $username, $password, $database);
$mysqli ->set_charset("utf8");

//Muestra en la pagina si hay conexion
if ($mysqli) {
	echo "<p style='
	display: table-cell;
	background: #cacaca00;
	bottom: 0;
	position: fixed;
	z-index; +1;
	vertical-align: middle;
	color: #5cbc04;
	opacity: 25%;
	'> </p";
	}
?>