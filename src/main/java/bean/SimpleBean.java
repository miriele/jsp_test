package bean;

public class SimpleBean {
	// simpleBeanForm에 있는 input tag의 name과 맞춰줘야 한다 
	private String	name;
	private int		age;
	private String	address;
	private String	tel;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
}
