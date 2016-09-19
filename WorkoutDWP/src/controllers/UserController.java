package controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.WorkoutDao;
import entities.Account;
import entities.User;

@Controller
public class UserController {
   @Autowired
   private WorkoutDao workoutDao;
   
   @RequestMapping(path="GetLogin.do", method=RequestMethod.POST, params = {"username","password"})
   public ModelAndView getLogin(String username, String password) {
	   Boolean login = workoutDao.userHasAccount(username, password);
	   Boolean admin = workoutDao.userIsAdmin(username, password);
	   if (login) {
		   System.out.println("Welcome " + workoutDao.getUser(username));
		   if (admin) System.out.println("You are an Admin");
	   } else System.out.println("Sorry, you are not authorized to use this system");
	   return new ModelAndView("user.jsp", "username", username);
   }
   
   @RequestMapping(path="GetUser.do", method=RequestMethod.GET, params = "id")
   public ModelAndView getUser(@RequestParam("id") int id) {
	   User user = workoutDao.getUser(id);
	   return new ModelAndView("user.jsp", "user", user);
   }
   
   @RequestMapping(path="GetUsers.do", method=RequestMethod.GET)
   public ModelAndView getUsers() {
	   List<User> users = workoutDao.getAllUsers();
	   return new ModelAndView("user.jsp", "users", users);
   }
   
   @RequestMapping(path="GetAccount.do", method=RequestMethod.GET, params = "id")
   public ModelAndView getAccount(@RequestParam("id") int id) {
	   Account account = workoutDao.getAccount(id);
	   return new ModelAndView("user.jsp", "account", account);
   }
   
   @RequestMapping(path="GetAccounts.do", method=RequestMethod.GET)
   public ModelAndView getAccounts() {
	   List<Account> accounts = workoutDao.getAllAccounts();
	   return new ModelAndView("user.jsp", "accounts", accounts);
   }
   
   
}
