<%@ page contentType="text/html; charset=gb2312" language="java" %> 
<%@page import="java.util.*" %>
<%@page import="com.thinktwice.dao.User" %>
<%@page import="java.sql.*" %>
<% 
String num = request.getParameter("username"); 
num=new String(num.getBytes("ISO8859-1"),"GB2312");
//����JDBC����
Class.forName("com.mysql.jdbc.Driver");
//�������ݿ�
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/easilyen","root","123456");
//����һ��JDBC����
Statement stmt = con.createStatement();
//��ѯ���ݿ����û�����ֵΪ��ǰ�û�����ֵ������
ResultSet rs = stmt.executeQuery("select count(*) from ee_user a where (select count(1) from ee_user b where a.username='"+num+"')>1");
rs.next();
rs.getString(1);
String sql = rs.getString(1);
//���ֵ����0��֤�����û����ѱ�ʹ��
if(Integer.parseInt(sql)>0)
   out.print("�������ѱ�ע�ᣬ��������д��"); 
else 
   out.print("��ϲ������ſ��ã�"); 
%>

