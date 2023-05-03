<marvel> {
for $marvel in doc('superheroes.xml')/marvel
return <medianivel>{avg($marvel/superheroe/@nivel)}</medianivel>
} </marvel>