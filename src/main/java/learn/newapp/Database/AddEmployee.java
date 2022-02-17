package learn.newapp.Database;

import learn.newapp.Database.CreateConnection;
import learn.newapp.Employee.Emp;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AddEmployee {
    public static String AddToDatabase(int id, String name, float salary, String designation, String department, int age,Connection connection){
        try{
            PreparedStatement ps = connection.prepareStatement("INSERT INTO Empnew VALUES(?, ?, ?, ?, ?, ?)");
            ps.setInt(1, id);
            ps.setString(2, name);
            ps.setFloat(3, salary);
            ps.setString(4, designation);
            ps.setString(5, department);
            ps.setInt(6, age);
            int i = ps.executeUpdate();
            System.out.println(i + " Record updated");
            ps.close();
            connection.close();
        }catch(SQLException e){
            System.out.println(e);
            return e.toString();

        }
        return "true";
    }
    public static String NewEmployee(int id, String name, float salary, String position, String department, int age) {
        String response;
        try {
            Connection connection = CreateConnection.connect();
            DatabaseMetaData dbm = connection.getMetaData();
            ResultSet table = dbm.getTables(null, null, "Empnew", null);
            if(table.next()){
                response = AddToDatabase(id, name, salary, position,department, age, connection);
            }
            else{
                String query = "CREATE TABLE Empnew"+
                        "(id INT NOT NULL," +
                        "name VARCHAR(50)," +
                        "salary DOUBLE NOT NULL,"+
                        "designation VARCHAR(50) NOT NULL,"+
                        "department VARCHAR(50) NOT NULL,"+
                        "age INT NOT NULL,"+
                        "PRIMARY KEY(id))";
                Statement st = connection.createStatement();
                st.executeUpdate(query);
                System.out.println("New Table has been created");
                response = AddToDatabase(id, name, salary, position ,department, age, connection);
            }


        } catch (SQLException e) {
            System.out.println(e);
            response = e.toString();
        }
        return response;
    }

    public static List<Emp> GetEmployee() {
        String query = "SELECT * FROM Empnew";
        List<Emp> list = new ArrayList<Emp>();
        Emp emp = null;
        try {
            Connection connection = CreateConnection.connect();
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                String n = rs.getString("name");
                int i = rs.getInt("id");
                float s = rs.getFloat("salary");
                String position = rs.getString("designation");
                String department = rs.getString("department");
                int age = rs.getInt("age");
                emp = new Emp(i, n, s, position, department, age);
                list.add(emp);
            }
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
            list.add(emp);
        }
        return list;
    }
    public static String DeleteEmployee(int id){
        try{
            Connection connection = CreateConnection.connect();
            String query = String.format("DELETE FROM Empnew WHERE id=%d", id);
            PreparedStatement ps = connection.prepareStatement(query);
            int i = ps.executeUpdate();
            System.out.println(1+" Record Deleted from Database");
        }catch(SQLException e){
            System.out.println(e);
            return e.toString();
        }
        return "true";
    }
    public static List<Emp> GetEmployeeById(int id) {
        String query = String.format("SELECT * FROM Empnew WHERE id=%d", id);
        List<Emp> list = new ArrayList<Emp>();
        Emp emp = null;
        try {
            Connection connection = CreateConnection.connect();
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                String n = rs.getString("name");
                int i = rs.getInt("id");
                float s = rs.getFloat("salary");
                String position = rs.getString("designation");
                String department = rs.getString("department");
                int age = rs.getInt("age");
                emp = new Emp(i, n, s, position, department, age);
                list.add(emp);
            }
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
            list.add(emp);
        }
        return list;
    }
    public static String UpdateEmployee(Emp emp){
        int id = emp.getId();
        String name = emp.getName();
        String department = emp.getDepartment();
        String designation = emp.getDesignation();
        float salary = emp.getSalary();
        int age = emp.getAge();
        String query = "UPDATE Empnew SET name=?,department=?, designation=?,age=?, salary=? WHERE id=?";

        try{
            Connection connection = CreateConnection.connect();
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setInt(6, id);
            pstmt.setString(1, name);
            pstmt.setString(2, department);
            pstmt.setString(3, designation);
            pstmt.setInt(4, age);
            pstmt.setFloat(5, salary);
            int i = pstmt.executeUpdate();
            System.out.println(i+" row updated in database");
        }catch(SQLException e){
            System.out.println(e);
            return e.toString();
        }
        return "true";
    }
}
