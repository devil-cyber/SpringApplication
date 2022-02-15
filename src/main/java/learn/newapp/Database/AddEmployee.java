package learn.newapp.Database;
import learn.newapp.Database.CreateConnection;
import learn.newapp.Employee.Emp;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AddEmployee {
    public static String NewEmployee(int id, String name, float salary, String position){
        try{
            Connection connection = CreateConnection.connect();
            PreparedStatement ps = connection.prepareStatement("INSERT INTO Emp VALUES(?, ?, ?, ?)");
            ps.setInt(1, id);
            ps.setString(2, name);
            ps.setFloat(3, salary);
            ps.setString(4, position);
            int i = ps.executeUpdate();
            System.out.println(i+" Record updated");
            ps.close();
            connection.close();
        } catch (SQLException e){
            System.out.println(e);
            return e.toString();
        }
        return "true";
    }
    public static List<Emp> GetEmployee(){
        String query = "SELECT * FROM Emp";
        List<Emp> list = new ArrayList<Emp>();
        Emp emp = null;
        try{
            Connection connection = CreateConnection.connect();
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(query);
            while(rs.next()) {
                String n = rs.getString("name");
                int i = rs.getInt("id");
                float s = rs.getFloat("salary");
                String position = rs.getString("designation");
                emp = new Emp(i, n, s, position);
                list.add(emp);
            }
            st.close();
        }catch (SQLException e){
            System.out.println(e);
            list.add(emp);
        }
        return list;
    }
}
