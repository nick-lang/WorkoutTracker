package entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Address {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@OneToMany(mappedBy="address")
	private List<User> users;
	
	private String address;
	private String address2;
	private String city;
	private String state;
	private String zip;
	private String phone;
	
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	
	public void addUser(User user) {
        if (users == null) {
             users = new ArrayList<>();
        }
        if (! users.contains(user)) {
             users.add(user);
             user.addAddress(this);
        }
	}
	
	 public void removeUser(User user) {
	     if (users != null && users.contains(user)) {
	         users.remove(user);
	         user.removeAddress(this);
	     }
	 }
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "Address [id=" + id + ", address=" + address + ", address2=" + address2 + ", city=" + city + ", state="
				+ state + ", zip=" + zip + ", phone=" + phone + "]";
	}
	
}
