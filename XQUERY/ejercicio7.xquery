<html>
<body> {
for $superheroe in doc('superheroes.xml')/marvel/superheroe
return <table border="1">
<tr>
<td>Nombre</td>
<td>Poderes</td>
<td>Amigos</td>
<td>Nivel</td>
</tr>
<tr>
<td>{data($superheroe/@nombre)}</td>
<td>{data($superheroe/@poderes)}</td>
<td>{data($superheroe/@amigos)}</td>
<td>{data($superheroe/@nivel)}</td>
</tr>
</table>
} </body>
</html>