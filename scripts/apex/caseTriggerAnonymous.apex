list<case> newCAses = new list<case>();
for (Integer i = 0; i < 210; i++) {
    list<case> updateCAses = [select id, status from case where status='Working'];
    case c = new case();
    c.Subject = 'trigger case';
    c.Status = 'New';
    c.Origin = 'Web';
    c.Description = 'Resolve it now';
    newCAses.add(c);
}
insert newCAses;

list<case> updateCAses = [select id, status from case where status='Working'];
for (case eachCase : updateCases) {
    eachCase.Status = 'New';
}
update updateCAses;