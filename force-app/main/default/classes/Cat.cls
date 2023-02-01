public class Cat {
    public string name;
    public string color;

    public Cat() {
        system.debug('cat contructor called. okay?');
    }

    //parameterized constructor
    public Cat(string n, string clr){
        name = n;
        color = clr;
        sleeping();
    }
    public cat(string n){
        name = n;
    }
    public void sleeping(){
        system.debug(name + ' is sleeping');
    }
}