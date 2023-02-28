@isTest //annotate our class with @istest -> this makes it a TEST class.
public  class CalculatorAgainTest {
    //create test methods.

    //1. public or private
    //2. must be static
    //3. Test method MUSt return void
        //we can call other methods which RETURNS something
    //4. no parameters allowed in TEST method
        //we can call other parameterized method inside test method
    //5. @isTEst annotation for test method
    @isTest
    private static void testMethod1() {
        CalculatorAgain c = new CalculatorAgain();
        c.publicMessage();
        c.welcomeMessage();
    }
    @isTest
    private static void testAdd1() {
        CalculatorAgain c = new CalculatorAgain();
        integer sum = c.add(5, 10);
        //we want to verify if sum is accurate or not
        //we call assertion, we will assert it here.
        system.assertEquals(15, sum);
    }
    @isTest
    private static void testAdd2() {
        CalculatorAgain c = new CalculatorAgain();
        integer sum = c.add(5, 10, 10);
        //we want to verify if sum is accurate or not
        //we call assertion, we will assert it here.
        system.assertEquals(25, sum);
    }
    @isTest
    private static void testMethod2() {
        CalculatorAgain c = new CalculatorAgain();
        string rt = c.printAndReturnMessage('print via test class');
        system.assertEquals('print via test class...OK Cool', rt);
    }
}