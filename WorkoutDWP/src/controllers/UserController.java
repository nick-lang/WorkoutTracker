package controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.WorkoutDao;
import entities.Account;
import entities.User;
import helpers.Date;

@Controller
public class UserController {
	@Autowired
	private WorkoutDao workoutDao;

	@RequestMapping(path = "GetLogin.do", method = RequestMethod.POST, params = { "username", "password" })
	public ModelAndView getLogin(String username, String password) {
		Account account = workoutDao.userHasAccount(username, password);
		Date date = new Date();

		// Boolean admin = workoutDao.userIsAdmin(username, password);
		// System.out.println("Test #1");
		// if (account != null) {
		// System.out.println("Welcome " + account.getUser().getFirstName() + "
		// " + account.getUser().getLastName());
		// if (admin) System.out.println("You are an Admin");
		// } else System.out.println("Sorry, you are not authorized to use this
		// system");
		//
		// User user = workoutDao.getUser(username);
		// System.out.println("Test #2");
		// if (user != null) {
		// System.out.println("Welcome " + user.getFirstName() + " " +
		// user.getLastName());
		// } else System.out.println("Sorry, you are not authorized to use this
		// system");

		ModelAndView mv = new ModelAndView("calendar.jsp");
		mv.addObject("account", account);
		mv.addObject("date", date);

		return mv;
	}

	@RequestMapping(path = "GetUser.do", method = RequestMethod.GET, params = "id")
	public ModelAndView getUser(@RequestParam("id") int id) {
		System.out.println("I'm here @ GetUser.do");
		User user = workoutDao.getUser(id);
		System.out.println("user: " + user);
		return new ModelAndView("user.jsp", "user", user);
	}

	@RequestMapping(path = "GetUsers.do", method = RequestMethod.GET)
	public ModelAndView getUsers() {
		List<User> users = workoutDao.getAllUsers();
		return new ModelAndView("user.jsp", "users", users);
	}

	@RequestMapping(path = "GetAccount.do", method = RequestMethod.GET, params = "id")
	public ModelAndView getAccount(@RequestParam("id") int id) {
		Account account = workoutDao.getAccount(id);
		return new ModelAndView("user.jsp", "account", account);
	}

	@RequestMapping(path = "GetAccounts.do", method = RequestMethod.GET)
	public ModelAndView getAccounts() {
		List<Account> accounts = workoutDao.getAllAccounts();
		return new ModelAndView("user.jsp", "accounts", accounts);
	}

	@RequestMapping(path = "GetCalendarData.do", params = "next", method = RequestMethod.GET)
	public ModelAndView getNextByMonth(@RequestParam("year") String year, @RequestParam("month") String month,
			@RequestParam("day") String day, @RequestParam("accountId") String accountId) {
		Date date = new Date();
		date.setNextMonth(Integer.parseInt(year), Integer.parseInt(month), Integer.parseInt(day));
		Account account = workoutDao.getAccount(Integer.parseInt(accountId));
		
		ModelAndView mv = new ModelAndView("calendar.jsp");
		mv.addObject("account", account);
		mv.addObject("date", date);
		return mv;
	}

	@RequestMapping(path = "GetCalendarData.do", params = "back", method = RequestMethod.GET)
	public ModelAndView getBackByMonth(@RequestParam("year") String year, @RequestParam("month") String month,
			@RequestParam("day") String day, @RequestParam("accountId") String accountId) {
		System.out.println(year + month + day + accountId);
		Date date = new Date();
		date.setPrevMonth(Integer.parseInt(year), Integer.parseInt(month), Integer.parseInt(day));
		Account account = workoutDao.getAccount(Integer.parseInt(accountId));

		ModelAndView mv = new ModelAndView();
		mv.setViewName("calendar.jsp");
		mv.addObject("account", account);
		mv.addObject("date", date);
		return mv;
	}
}
