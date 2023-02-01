car vw = new car();
vw.carColor = 'white';
vw.carName = 'polo';
//vw.maxSpeed = 100;
//system.debug('vw max speed => ' + vw.maxSpeed);
vw.switchOn();
vw.drive();
vw.driveAtMaxSpeed();



car bm = new car();
bm.carColor = 'Black';
system.debug('bm ==> ' + bm);
bm.switchOn();
system.debug('bm color => ' + bm.carColor);

car lm = new car();
lm.carColor = 'red';
//lm.maxSpeed = 200;
lm.switchOn();
//system.debug('lm max speed => ' + lm.maxSpeed);