/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Merisa
 */
public class DB {

    private static DB instance;
    private static Connection con;

    public DB() {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();

            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/dbnovosti_46_29?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "1234");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static DB getInstance(){
        if(instance == null){
            instance = new DB();
        }
        return instance;
    }
    
    public Connection getConnection( ){
        return con;
    }
}
