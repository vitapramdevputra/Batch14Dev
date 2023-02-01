Candidates.companyName = 'Softinnovas';

system.debug('0. comapny name ' + Candidates.companyName);
system.debug('start count candidates => ' + Candidates.countCandidates);

Candidates c1 = new Candidates();
Candidates.countCandidates++;
c1.name = 'Jerry';
c1.gender = 'Male';
c1.printCandidate();
system.debug('1. comapny name ' + Candidates.companyName);



Candidates c2 = new Candidates();
Candidates.countCandidates++;
c2.name = 'Elaine';
c2.gender = 'Female';
c2.printCandidate();
system.debug('2. comapny name ' + Candidates.companyName);

Candidates.companyName = 'Vandaley industries';

Candidates c3 = new Candidates();
Candidates.countCandidates++;
c3.name = 'George';
c3.gender = 'Male';
c3.printCandidate();
system.debug('3. comapny name ' + Candidates.companyName);

c1.printCandidate();
c2.printCandidate();
system.debug('end count candidates => ' + Candidates.countCandidates);
Candidates.printCompany();
