with open('C:/Users/11/Desktop/AISystems/lab1/main.pl') as file, open('C:/Users/11/Desktop/AISystems/lab2/result.txt', 'w') as res:
    resultObj = {}
    for line in file:
        if 'findTroopWithTypeInFraction' in line:
            break
        if 'troop(' in line:
            troop = line.replace("troop(", '').replace(').', '').strip()
            resultObj[troop] = {}
        if 'hasParent(' in line:
            troop, parent = line.replace("hasParent(", '').replace(').', '').strip().split(', ')
            resultObj[troop]['parent'] = parent
        if 'hasFraction(' in line:
            troop, fraction = line.replace("hasFraction(", '').replace(').', '').strip().split(', ')
            resultObj[troop]['fraction'] = fraction
        if 'hasType(' in line:
            troop, type = line.replace("hasType(", '').replace(').', '').strip().split(', ')
            resultObj[troop]['type'] = type
    for key, value in resultObj.items():
        res.write(f'''<owl:NamedIndividual rdf:about="http://www.semanticweb.org/11/ontologies/2023/9/lab2#{key}">
    <rdf:type rdf:resource="http://www.semanticweb.org/11/ontologies/2023/9/lab2#troop"/>
    <lab2:hasFraction rdf:resource="http://www.semanticweb.org/11/ontologies/2023/9/lab2#{value['fraction']}"/>
    {f'<lab2:hasParent rdf:resource="http://www.semanticweb.org/11/ontologies/2023/9/lab2#{value["parent"]}"/>' if 'parent' in value.keys() else ""}
    <lab2:hasType rdf:resource="http://www.semanticweb.org/11/ontologies/2023/9/lab2#{value['type']}"/>
</owl:NamedIndividual>\n''')
