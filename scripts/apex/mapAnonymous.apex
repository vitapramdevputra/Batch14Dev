map<string, string> mapCountryCurrency = new map<string, string>();
                //put(datatype_of_key, datatype_of_value)
mapCountryCurrency.put('USA', 'Dollar');
mapCountryCurrency.put('France', 'Euro');
mapCountryCurrency.put('Poland', 'Euro');
mapCountryCurrency.put('India', 'Rupees');
mapCountryCurrency.put('India', 'Rupee');
mapCountryCurrency.put('Turkiye', 'Lira');
mapCountryCurrency.put('El Salvador', 'Bitcoin');
system.debug('map of country and its currency ===> ' + mapCountryCurrency);

//get value using KEY from a map. 
string IndiaCurrency = mapCountryCurrency.get('India');
string TurkiyeCurrency = mapCountryCurrency.get('Turkiye');
system.debug('India currency is ' + IndiaCurrency);
system.debug('Turkiye currency is ' + TurkiyeCurrency);

//get all keys using keyset method
set<string> countrySet = mapCountryCurrency.keySet();
system.debug('countries are ' + countrySet);

list<string> currencies = mapCountryCurrency.values();
system.debug('currencies are ' + currencies);

//--for each loop of map start here

set<string> countries = mapCountryCurrency.keySet();

//for each loop on country set

for(string eachKey: countrySet){
    //eachKey => USA (1)
    //eachKey => France (2)
    string printString = 'Country is ' + eachKey;
    //value from key from a map
    //get currency of key USA
    //mapCountryCurrency.get('USA') ==> Dollar
    //mapCountryCurrency.get('France') ==> Euro
    string eachValue = mapCountryCurrency.get(eachKey);
    printString += ', its currency is ' + eachValue;
    system.debug(printString);
}