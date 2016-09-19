package data;

import java.time.LocalDate;
import java.time.temporal.TemporalAdjusters;

public class Date {
	LocalDate date;
	private int year;
	private String monthName;
	private int days;
	
	//The number of the day of the week, that is the first day of the month
	private int firstDayOfMonth;
	
	public Date() {
		date = LocalDate.now();
		setValues();
	}
	
	public void setValues() {
		year = date.getYear();
		int month = date.getMonthValue();
		monthName = Months.fromInteger(month);
		days = date.with(TemporalAdjusters.lastDayOfMonth()).getDayOfMonth();
		firstDayOfMonth = date.with(TemporalAdjusters.firstDayOfMonth()).getDayOfWeek().getValue();
	}
	
	
	public void setNextMonth() {
		date = date.plusMonths(1);
		setValues();
	}
	public void setPrevMonth() {
		date = date.minusMonths(1);
		setValues();
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
