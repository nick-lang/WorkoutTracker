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
import entities.Address;
import entities.User;

@Controller
public class UserController {
   @Autowired
   private WorkoutDao workoutDao;
   
   @RequestMapping(path="GetLogin.do", method=RequestMethod.POST, params = {"username","password"})
   public ModelAndView getLogin(String username, String password) {
	   Account account = workoutDao.userHasAccount(username, password);
	   Boolean admin = workoutDao.userIsAdmin(username, password);
	   System.out.println("Test #1");
	   if (account != null) {
		   System.out.println("Welcome " + account.getUser().getFirstName() + " " + account.getUser().getLastName());
		   if (admin) System.out.println("You are an Admin");
	   } else System.out.println("Sorry, you are not authorized to use this system");
	   
	   User user = workoutDao.getUser(username);
	   System.out.println("Test #2");
	   if (user != null) {
		   System.out.println("Welcome " + user.getFirstName() + " " + user.getLastName());
	   } else System.out.println("Sorry, you are not authorized to use this system");
	   
	   account = workoutDao.getAccount(username);
	   System.out.println("Test #3");
	   if (user != null) {
		   System.out.println("Welcome " + account.getUser().getFirstName() + " " + account.getUser().getLastName());
	   } else System.out.println("Sorry, you are not authorized to use this system");
	   return new ModelAndView("user.jsp", "username", username);
   }
   
   @RequestMapping(path="GetUser.do", method=RequestMethod.GET, params = "id")
   public ModelAndView getUser(@RequestParam("id") int id) {
	   System.out.println("I'm here @ GetUser.do");
	   User user = workoutDao.getUser(id);
	   System.out.println("user: " + user);
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
   
   @RequestMapping(path="CreateNewUser.do", method=RequestMethod.GET)
	   public ModelAndView createNewUser(String firstName, String lastName, int age, String gender, Double height, Double weight, String email,
			   String address, String address2, String city, String state, String zip, String phone,
			   String username, String password) {
//	   public ModelAndView createNewUser(User userNew, Account accountNew, Address addressNew) {

	   User userNew = new User();
	   userNew.setFirstName(firstName);
	   userNew.setLastName(lastName);
	   userNew.setAge(age);
	   userNew.setGender(gender);
	   userNew.setHeight(height);
	   userNew.setWeight(weight);
	   userNew.setEmail(email);
	   
	   Address addressNew = new Address();
	   addressNew.setAddress(address);
	   addressNew.setAddress2(address2);
	   addressNew.setCity(city);
	   addressNew.setState(state);
	   addressNew.setZip(zip);
	   addressNew.setPhone(phone);
	   
	   Account accountNew = new Account();
	   accountNew.setUsername(username);
	   accountNew.setPassword(password);;
	   
	   System.out.println("New User: " + userNew);
	   System.out.println("New Address: " + addressNew);
	   System.out.println("New Account username: " + accountNew.getUsername());
	   System.out.println("New Account password: " + accountNew.getPassword());
	   workoutDao.createUserAccount(accountNew, userNew, addressNew);
      return new ModelAndView("user.jsp", "address", addressNew);
   }
   
   
}
