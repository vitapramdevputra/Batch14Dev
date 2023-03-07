integer x = 498347;
integer remainder = 0;
integer reverseNumber = 0;

while(x>0){
    system.debug('x=' + x);
    remainder = math.mod(x, 10);
    system.debug('remainder=' + remainder);
    
    reverseNumber = (reverseNumber*10)+remainder;
    system.debug('reverseNumber=' + reverseNumber);

    x = x/10;
    
}
system.debug('FINAL' + reverseNumber);
