package enterprise.web.jdbc;


import enterprise.web.jdbc.distributor;
import enterprise.web.jdbc.itemdb;
import enterprise.web.jdbc.items;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author mythr
 */
public class distributordb {
      public static List<distributor> getdlist(int itemid) throws ClassNotFoundException, SQLException{
        int itemidz=itemid;
         List<distributor> dis=new ArrayList<>();
        try {
           
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/enterprise?useSSL=false", "root", "root");
            String qur="select * from distributor where  itemid=?";
            PreparedStatement pst=con.prepareStatement(qur);
            pst.setInt(1, itemidz);
            ResultSet rs=pst.executeQuery();
            while(rs.next()){
            int itid=rs.getInt(1);
            String ite=rs.getString(2);
            String quan=rs.getString(3);
            int blah=rs.getInt(4);
            distributor itm=new distributor(itid,ite,quan,blah);
            dis.add(itm);
            }
            pst.close();
            rs.close();
            con.close();
            
            
            return dis;
        } catch (InstantiationException | IllegalAccessException ex) {
            Logger.getLogger(itemdb.class.getName()).log(Level.SEVERE, null, ex);
        }
        return dis;
    
}

  
}
