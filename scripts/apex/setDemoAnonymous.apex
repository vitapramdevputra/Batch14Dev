Set<String> cities = new set<string>();
cities.add('Tokyo');
cities.add('Lisbon');
cities.add('Berlin');
cities.add('Nairobi');
cities.add('Tokyo');
cities.add('BERLIN');
cities.add('Nairobi');

set<string> capCities = SetDemo.upperCaseSet(cities);
system.debug(capCities);


list<integer> l1 = new list<integer>();
l1.add(10);
l1.add(15);
l1.add(21);
l1.add(15);
l1.add(15);
set<integer> s1 = SetDemo.setFromList(l1);
system.debug('l1 ' + l1);
system.debug('s1 ' + s1);

SetDemo.randomIntegerSet();
SetDemo.citySet();

