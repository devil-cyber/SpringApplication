package learn.newapp.Employee;
public class Emp {
    private int id;
    private String name;
    private float salary;
    private String designation;
    private String department;
    private int age;
    public Emp(){

    }
    public Emp(int id, String name, float salary, String designation, String department, int age){
        super();
        this.id = id;
        this.name = name;
        this.salary = salary;
        this.designation = designation;
        this.age = age;
        this.department = department;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getSalary() {
        return salary;
    }

    public void setSalary(float salary) {
        this.salary = salary;
    }

    public String getDesignation() {
        return designation;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }
}

