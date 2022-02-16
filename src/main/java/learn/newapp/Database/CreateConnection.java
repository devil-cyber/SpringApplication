package learn.newapp.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class CreateConnection {
    public static Connection connect() {
        Connection connection = null;
        try {
            //System.out.println("create connection called again" + " " + connection);
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/db",
                    "newuser", "Mani360@kant");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
        return connection;
    }
}
