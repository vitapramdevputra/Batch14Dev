public class Candidates {
    public string name;//we can set and get values using instances (object)
    public string gender;//we can set and get values using instances (object)
    
    public static integer countCandidates = 0;
    public static string companyName; //we can set and get values directly from class.

    public void printCandidate(){
        system.debug('---- start ----');
        system.debug('candidate name is ' + name + ', gender is ' + gender);
        system.debug('company name is ' + companyName);
        system.debug('---- end ----');
    }
    public static void printCompany() {
        system.debug('company => ' + companyName);
        //we cannot access NON-static members inside static methods.
        //system.debug('name of candidate => ' + name);
    }
}