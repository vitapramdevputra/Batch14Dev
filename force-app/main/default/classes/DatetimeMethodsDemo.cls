public class DatetimeMethodsDemo {
    public void calculateAgeInMonths(){
        //local variable.
        date birthDate = date.newInstance(1990, 10, 9);
        date todayDate = date.today();

        //age in months using monthsBetween
        integer ageInMonths = birthDate.monthsBetween(todayDate);
        system.debug('Vitap age in months is ==> ' + ageInMonths);

        integer ageInDays = birthDate.daysBetween(todayDate);
        system.debug('Vitap age in days => ' + ageInDays);
        system.debug(birthDate);
    }
    public void printSubscriptionEndDate(){
        Date subStartDate = date.today();

        Date subEndDate = subStartDate.addDays(1000);
        system.debug('subscription end date is ==> ' + subEndDate);

        //year 
        integer endDateYear = subEndDate.year();
        system.debug('year of end date ' + endDateYear);
        //month 
        integer endDateMonth = subEndDate.month();
        system.debug('month of end date ' + endDateMonth);
    }
    public void printOfferEndDate(){
        datetime offerStart = datetime.now();
        datetime offerEnd = offerStart.addHours(51);

        system.debug('offer end datetime is ' + offerEnd);

        //JUST the DATE component of offerEnd
        Date offerEndDATE = offerEnd.date();
        system.debug('offer enddate is ' + offerEndDATE);
    }
    public void birthDateInMS(){    
                            //year, month, day, hour, minute, seconds
        datetime birthDT = datetime.newInstance(1990, 10, 9, 7, 30, 00);
        long birthDateMS = birthDT.getTime();
        system.debug('Vitap birth datetime in milliseconds --> ' + birthDateMS);
    }
}