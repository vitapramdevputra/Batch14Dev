public class ListDemo {
    //pass index number in parameter
        //return the candidate at THAT index
    public static string candidateList(integer i) {
        List<string> listCandidates = new list<string>();
        listCandidates.add('Marc');
        listCandidates.add('Elon');
        listCandidates.add('Bill');
        listCandidates.add('Marc');
        system.debug('candidates ==> ' + listCandidates);
        
        string candidate = '';
        //check if i (parameter) < size
        if (i >= 0 && i < listCandidates.size()) {
            candidate = listCandidates[i];
        } else {
            candidate = 'No value found. Try again later';
        }
        return candidate;
    }

    public static void randomIntegerList() {
        List<integer> listInteger = new List<integer>();
        listInteger.add(10);
        listInteger.add(15);
        listInteger.add(21);
        listInteger.add(15);
        listInteger.add(15);
        system.debug('random integer list ==> ' + listInteger);
        
        integer index3value = listInteger.get(3);
        //OR
        integer index3value2 = listInteger[3];
        system.debug('value at index 3 => ' + index3value);
        system.debug('value at index 3, again => ' + index3value2);
    }

    public static void allCats() {
        //create list of cat class.
        List<cat> cats = new List<cat>();
        //how to add elements in list of cat?
            //which elements we can add?
                //A. we can instances of CAT class in this list.
        
        //create instances of cat class.
        cat c1 = new cat('cinamon','brown');
        cat c2 = new cat('duman','dark gray');
        cat c3 = new cat();
        cats.add(c1);
        cats.add(c2);
        cats.add(c3);
        system.debug('cats ===> ' + cats);
        if (!cats.isEmpty()) {
            system.debug('cat at 0 ' + cats[0]);
        }
    }

    public static void iterateList(){
        List<integer> listInteger = new List<integer>();
        listInteger.add(10);
        listInteger.add(15);
        listInteger.add(21);
        listInteger.add(15);
        listInteger.add(15);
        
        for( integer eachInteger : listInteger){
            system.debug(eachInteger);
        }
    }
}