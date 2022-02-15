package learn.newapp.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class CreateConnection {
    public static Connection connect() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/db",
                    "newuser", "Mani360@kant");
        }catch (ClassNotFoundException | SQLException e){
            System.out.println(e);
        }
        return connection;
    }
}
