<marvel> {
for $superheroe in doc('superheroes.xml')/marvel/superheroe
where contains($superheroe/@poderes, 'fuerza')
and contains($superheroe/@amigos, 'Iron Man')
return <superheroe poderes="{$superheroe/@poderes}"
amigos="{$superheroe/@amigos}">
{data($superheroe/@nombre)}</superheroe>
} </marvel>