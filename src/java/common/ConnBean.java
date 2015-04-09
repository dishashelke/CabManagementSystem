/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package common;

import java.sql.*;

/**
 *
 * @author kjayanta
 */
public class ConnBean {

  /* private String url="jdbc:mysql://10.50.1.5:3306/batch2010_CMS";
    private String user="CMS";
    private String password="test";*/
   
          /* String url="jdbc:mysql://localhost:3306/test";
            String user = "root";
            String password = "test";*/
    String url="jdbc:mysql:///CMS";
            String user = "root";
            String password = "cms";
   
            Connection con = null;

    public ConnBean() {
        System.out.println("Inside Connection DB Bean...!");
    }

    public String getPassword() {
        return password;
    }

    public String getUrl() {
        return url;
    }

    public String getUser() {
        return user;
    }

    public Connection connect() 
    {
        
        try{
        ConnBean conn = new ConnBean();
        String driver = "com.mysql.jdbc.Driver";
        Class.forName(driver).newInstance();
        con=DriverManager.getConnection(conn.getUrl(),conn.getUser(),conn.getPassword());
        //System.out.print("Connected Successfully..!");
        return con;
        }
        catch(Exception e)
        {
            System.out.println("Exception Occured...!");
            e.printStackTrace();
            return con;
        }
    }

    public boolean closeConn()
    {
        try{
            con.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return true;
    }
    
    

}
