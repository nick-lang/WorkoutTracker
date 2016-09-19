package helpers;

import java.time.LocalDate;
import java.time.temporal.TemporalAdjusters;

public class Date {
	LocalDate date;
	private int year;
	private String monthName;
	private int days;
	
	//used to get next or prev month
	private int monthInt;
	private int dayInt;
	
	//The number of the day of the week, that is the first day of the month
	private int firstDayOfMonth;

	
	public Date() {
		date = LocalDate.now();
		setValues();
	}
	
	public void setValues() {
		year = date.getYear();
		monthInt = date.getMonthValue();
		dayInt = date.getDayOfMonth();
		
		monthName = Months.fromInteger(monthInt);
		days = date.with(TemporalAdjusters.lastDayOfMonth()).getDayOfMonth();
		firstDayOfMonth = date.with(TemporalAdjusters.firstDayOfMonth()).getDayOfWeek().getValue();
		
	}
	
	
	public void setNextMonth(int y, int m, int d) {
		date = LocalDate.of(y, m, d);
		date = date.plusMonths(1);
		setValues();
	}
	public void setPrevMonth(int y, int m, int d) {
		date = LocalDate.of(y, m, d);
		date = date.minusMonths(1);
		setValues();
	}
	
	public int getDayInt() {
		return dayInt;
	}

	public void setDayInt(int dayInt) {
		this.dayInt = dayInt;
	}

	public int getMonthInt() {
		return monthInt;
	}

	public void setMonthInt(int monthInt) {
		this.monthInt = monthInt;
	}

	public int getFirstDayOfMonth() {
		return firstDayOfMonth;
	}

	public void setFirstDayOfMonth(int firstDayOfMonth) {
		this.firstDayOfMonth = firstDayOfMonth;
	}

	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public String getMonthName() {
		return monthName;
	}
	public void setMonthName(String monthName) {
		this.monthName = monthName;
	}
	public int getDays() {
		return days;
	}
	public void setDays(int days) {
		this.days = days;
	}
	
	
}
