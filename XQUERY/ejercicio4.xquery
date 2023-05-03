<marvel> {
for $superheroe in doc('superheroes.xml')/marvel/superheroe
where contains(lower-case($superheroe/@poderes), 'fuerza')
and contains(lower-case($superheroe/@amigos), 'iron man')
return <superheroe poderes="{$superheroe/@poderes}"
amigos="{$superheroe/@amigos}">
{data($superheroe/@nombre)}</superheroe>
} </marvel>