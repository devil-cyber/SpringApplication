package learn.newapp.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class CreateConnection {
    public static Connection connect() {
        String server = "mysql-69188-0.cloudclusters.net";
        String dbName = "db";
        String user = "admin";
        String password = "WqbUgRZI";
        int PORT = 19878;
        String url = String.format("jdbc:mysql://%s:%d?user=%s&password=%s",
                server, PORT, user, password);
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url);
            Statement stmt = connection.createStatement();
            String sqlusedb = "use " + dbName;
            int result = stmt.executeUpdate(sqlusedb);
        }catch (ClassNotFoundException | SQLException e){
            System.out.println(e);
        }
        return connection;
    }
}
