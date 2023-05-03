<marvel> {
for $superheroe in doc('superheroes.xml')/marvel/superheroe
where contains($superheroe/@poderes, 'fuerza')
return <superheroe poderes="{$superheroe/@poderes}">
{data($superheroe/@nombre)}</superheroe>
} </marvel>