public class SetDemo {
    public static void citySet() {
        Set<String> cities = new set<string>();
        cities.add('Tokyo');
        cities.add('Lisbon');
        cities.add('Berlin');
        cities.add('Nairobi');
        cities.add('Tokyo');
        cities.add('BERLIN');
        cities.add('Nairobi');

        system.debug('city set: ' + cities);
    }

    public static void randomIntegerSet() {
        Set<integer> intSet = new Set<integer>();
        intSet.add(10);
        intSet.add(15);
        intSet.add(21);
        intSet.add(15);
        intSet.add(15);
        intSet.add(15);
        system.debug('set of integers ' + intSet);
    }

    //create a method, which accepts a list<integer>
        //we will return set<integer>
        //list might have duplicate values. 
        //when we return set<integer> duplicats will be removed.
    public static set<integer> setFromList(list<integer> listInt) {
        //create empty set to add all the elements of list.
        Set<Integer> returnSet = new Set<Integer>();
        //use .addAll(list_or_set) method to add all the elements from list to set.
        returnSet.addAll(listInt);
        return returnSet;
    }

    //we will create a method to convert set to uppercase.
        //out method will accept set<string> 
        //return set<string> by converting each element to upperCase
    public static set<string> upperCaseSet(set<string> setStr) {
        //prepare empty set in which we will add uppercase strings.
        set<string> upperSet = new set<string>();

        //for each loop of set
        for (string eachStr : setStr) {
            string tempStr = eachStr.toUpperCase();
            upperSet.add(tempStr);
        }
        return upperSet;
    }
}