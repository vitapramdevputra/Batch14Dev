public class PrimitiveDataTypeDemo2 {
    public void printNewDate(){
        system.debug('create new dates here');
                                    //year, month, day
        Date newDate = date.newInstance(1995, 2, 15);
        system.debug('new date is ' + newDate);

        Date newDate2 = date.newInstance(2022, 1, 9);
        system.debug('new date2 is ' + newDate2);

        Date todayDate = date.today();
        system.debug('today date is ' + todayDate);
    }
    public void printNewTime(){
        //newInstance Hour, Minute, Seconds, milliseconds
        Time myTime = time.newInstance(18, 50, 15, 40);
        system.debug('my time is ' + myTime);

        Time myTime2 = time.newInstance(9, 80, 30, 20);
        system.debug('my time2 is ' + myTime2);
    }
    public void printNewDateTime(){
        Date newDate = date.today();
        Time newTime = time.newInstance(8, 50, 30, 40);

        //1. new datetime using DATE and TIME
        Datetime dt1 = Datetime.newInstance(newDate, newtime);
        system.debug('dt1 ' + dt1);

        //2. new datetime using YEAR, MONTH, DAY . 
        //Default time is midnight (00000) user's timezone
            //midnight in EST. Print in GMT.
        Datetime dt2 = Datetime.newInstance(2020, 5, 25);
        system.debug('dt2 is(PRINTS in GMT) ' + dt2);

        //3. newinstance using YEAR, MONTH, DAY, HOUR, MINUTE, SECOND
        Datetime dt3 = Datetime.newInstance(1999, 9, 14, 2, 50, 30);
        system.debug('dt3 ' + dt3);

        //4. newInstance from longtime
        //datetime from 1970 Jan 1 00:00:00 GMT
        long longTime = 0;
        datetime dt4 = datetime.newInstance(longtime);
        system.debug('dt4 ' + dt4);

        long longTime2 = 1365424876541L;
        datetime dt4_1 = datetime.newInstance(longTime2);
        system.debug('dt4_1 => ' + dt4_1);

        //6. now
        datetime dt6 = datetime.now();
        system.debug('dt6 is ' + dt6);

        //5. newinstanceGMT
        datetime dt5 = datetime.newInstanceGmt(1998, 5, 18, 15, 15, 15);
        system.debug('dt5 ' + dt5);
    }
}