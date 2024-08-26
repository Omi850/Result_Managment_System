package com.dau;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bean.result;
import com.bean.student;
public class Query {
  public static int insert(student ob) throws ClassNotFoundException, SQLException {
	 Connection con=Connecter.connect();
	 PreparedStatement ps=con.prepareStatement("insert into student2(name,mobile_number,gender,city,password) values(?,?,?,?,?)");
	 ps.setString(1, ob.getName());
	 ps.setString(2, ob.getMobile());
	 ps.setString(3, ob.getGender());
	 ps.setString(4, ob.getCity());
	 ps.setString(5, ob.getPassword());
	 return ps.executeUpdate();
  }
  public static boolean login(String mobile,String pass) throws ClassNotFoundException, SQLException {
		 Connection con=Connecter.connect();
		 PreparedStatement ps=con.prepareStatement("select * from student2 where mobile_number=? and password=?");
		 ps.setString(1, mobile);
		 ps.setString(2, pass);
		 ResultSet rs=ps.executeQuery();
		 return rs.next(); 
   }
  public static ArrayList<student> fetch() throws ClassNotFoundException, SQLException {
		 Connection con=Connecter.connect();
		 PreparedStatement ps=con.prepareStatement("select * from student2");
		 ResultSet rs=ps.executeQuery();
		 ArrayList<student> ob=new ArrayList();
		 while(rs.next()) {
			 student obdata=new student();
			 obdata.setId(rs.getInt(1));
			 obdata.setName(rs.getString(2));
			 obdata.setMobile(rs.getString(4));
			 obdata.setGender(rs.getString(3));
			 obdata.setCity(rs.getString(5));
			 obdata.setPassword(rs.getString(6));
             ob.add(obdata);
		 }
		 return ob;
    }
  
  public static ArrayList<result> fetchresult() throws ClassNotFoundException, SQLException {
		 Connection con=Connecter.connect();
		 PreparedStatement ps=con.prepareStatement("select * from result");
		 ResultSet rs=ps.executeQuery();
		 ArrayList<result> ob=new ArrayList();
		 while(rs.next()) {
			 result obdata=new result();
			 obdata.setId(rs.getInt(2));
			 obdata.setJava(rs.getInt(3));
			 obdata.setAjava(rs.getInt(4));
			 obdata.setHtml(rs.getInt(5));
			 obdata.setCss(rs.getInt(6));
			 obdata.setScript(rs.getInt(7));
			 obdata.setTotal_mark(rs.getInt(8));
			 obdata.setPer(rs.getFloat(9));
             ob.add(obdata);
		 }
		 return ob;
 }
  public static ArrayList<result> fetchresultdata(String pass) throws ClassNotFoundException, SQLException {
		 Connection con=Connecter.connect();
		 PreparedStatement ps1=con.prepareStatement("select * from student2 where password=?");
		 ps1.setString(1, pass);
		 ResultSet rs1=ps1.executeQuery();
		 rs1.next();
		 PreparedStatement ps=con.prepareStatement("select * from result where student_id="+rs1.getInt(1));
		 ResultSet rs=ps.executeQuery();
		 ArrayList<result> ob=new ArrayList();
		 while(rs.next()) {
			 result obdata=new result();
			 obdata.setId(rs.getInt(2));
			 obdata.setJava(rs.getInt(3));
			 obdata.setAjava(rs.getInt(4));
			 obdata.setHtml(rs.getInt(5));
			 obdata.setCss(rs.getInt(6));
			 obdata.setScript(rs.getInt(7));
			 obdata.setTotal_mark(rs.getInt(8));
			 obdata.setPer(rs.getFloat(9));
          ob.add(obdata);
		 }
		 return ob;
}
  public static student fetchdata(int id) throws ClassNotFoundException, SQLException {
		 Connection con=Connecter.connect();
		 PreparedStatement ps=con.prepareStatement("select * from student2 where id="+id);
		 ResultSet rs=ps.executeQuery();
		     rs.next();
			 student obdata=new student();
			 obdata.setId(rs.getInt(1));
			 obdata.setName(rs.getString(2));
			 obdata.setMobile(rs.getString(4));
			 obdata.setGender(rs.getString(3));
			 obdata.setCity(rs.getString(5));
			 obdata.setPassword(rs.getString(6));
		     return obdata;
 }
  public static student updatefetch(int id) throws ClassNotFoundException, SQLException {
		 Connection con=Connecter.connect();
		 PreparedStatement ps=con.prepareStatement("select * from student2 where id="+id);
		 ResultSet rs=ps.executeQuery();
		 student obdata=new student();
		 rs.next();
			 obdata.setId(rs.getInt(1));
			 obdata.setName(rs.getString(2));
			 obdata.setMobile(rs.getString(4));
			 obdata.setGender(rs.getString(3));
			 obdata.setCity(rs.getString(5));
			 obdata.setPassword(rs.getString(6));
		
		 return obdata;
 }
  public static int update(student ob) throws ClassNotFoundException, SQLException {
		 Connection con=Connecter.connect();
		 PreparedStatement ps=con.prepareStatement("update student2 set name=?,mobile_number=?,gender=?,city=?,password=? where id="+ob.getId());
         ps.setString(1, ob.getName());
         ps.setString(2, ob.getMobile());
         ps.setString(3, ob.getGender());
         ps.setString(4, ob.getCity());
         ps.setString(5, ob.getPassword());
         return ps.executeUpdate();
  }
  public static int delete(int id) throws ClassNotFoundException, SQLException {
		 Connection con=Connecter.connect();
		 PreparedStatement ps=con.prepareStatement("delete from student2 where id="+id);
         return ps.executeUpdate();
  }
  public static int deleteresult(int id) throws ClassNotFoundException, SQLException {
		 Connection con=Connecter.connect();
		 PreparedStatement ps=con.prepareStatement("delete from result where student_id="+id);
      return ps.executeUpdate();
}
  public static int Insertresult(result ob) throws ClassNotFoundException, SQLException {
		 Connection con=Connecter.connect();
		 PreparedStatement ps=con.prepareStatement("insert into result(student_id,java,ajava,html,"
		 		+ "css,script,total_marks,percentage) values(?,?,?,?,?,?,?,?)");
		 ps.setInt(1,ob.getId());
		 ps.setInt(2,ob.getJava());
		 ps.setInt(3,ob.getAjava());
		 ps.setInt(4,ob.getHtml());
		 ps.setInt(5,ob.getCss());
		 ps.setInt(6,ob.getScript());
		 ps.setInt(7,(ob.getScript()+ob.getAjava()+ob.getCss()+ob.getJava()+ob.getHtml()));
		 ps.setFloat(8,((float)(((float)(ob.getScript()+ob.getAjava()+ob.getCss()+ob.getJava()+ob.getHtml()))/5)));
		 return ps.executeUpdate();
  }
  public static result resultdata(int id) throws ClassNotFoundException, SQLException {
		 Connection con=Connecter.connect();
		 PreparedStatement ps=con.prepareStatement("select * from result where student_id="+id);
		 ResultSet rs=ps.executeQuery();
		 rs.next();
	     result ob=new result();
		 ob.setId(rs.getInt(2));
		 ob.setJava(rs.getInt(3));
		 ob.setAjava(rs.getInt(4));
		 ob.setHtml(rs.getInt(5));
		 ob.setCss(rs.getInt(6));
		 ob.setScript(rs.getInt(7));
		 ob.setTotal_mark(rs.getInt(8));
		 ob.setPer(rs.getFloat(9));
		 return ob;
  }
  public static Boolean resultrun(int id) throws ClassNotFoundException, SQLException {
		 Connection con=Connecter.connect();
		 PreparedStatement ps=con.prepareStatement("select * from result where student_id="+id);
		 ResultSet rs=ps.executeQuery();
		 return rs.next();
  } 
  public static Boolean admindata(int mobile,int pass) throws ClassNotFoundException, SQLException {
		 Connection con=Connecter.connect();
		 PreparedStatement ps=con.prepareStatement("select * from admin where mobile="+pass+" and password="+pass);
         ResultSet rs=ps.executeQuery();
         return rs.next();
  }
  public static int reset(int old,int newpass) throws ClassNotFoundException, SQLException {
		 Connection con=Connecter.connect();
		 PreparedStatement ps=con.prepareStatement("select * from admin where password="+old);
         ResultSet rs=ps.executeQuery();
         if(rs.next()) {
    		 PreparedStatement psd=con.prepareStatement("update admin set password=? where password=?");
    		 psd.setInt(1,newpass);
    		 psd.setInt(2,old);
    		 return psd.executeUpdate();
         }else {
        	 return 0;
         }
     }
}
