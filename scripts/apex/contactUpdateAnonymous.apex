contact c = [select id, leadsource from contact limit 1];
try {
    c.LeadSource = 'Web';
    update c;
} catch (Exception ex) {
    system.debug('cannot update lead source.');
}
