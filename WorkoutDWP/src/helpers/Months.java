package helpers;

public class Months {	
	public static String fromInteger(int x) {
        switch(x) {
        case 1:
            return "January";
        case 2:
            return "Feruary";
        case 3:
            return "March";
        case 4:
            return "April";
        case 5:
            return "May";
        case 6:
            return "June";
        case 7:
            return "July";
        case 8:
            return "August";
        case 9:
            return "September";
        case 10:
            return "October";
        case 11:
            return "November";
        case 12:
            return "December";
        }
        return null;
    }
}
