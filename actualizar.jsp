<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
	 body{
	 background-color:#c5ccea;
	 }
	 
	 table{
	 border:solid 2px #0a133b;
	  margin-left:370px;
	 }
	 
	 h1{
	 margin-left:370px;
	 }

</style>
</head>

<body>
 <h1>ACTUALIZAR</h1>
   <%
   
  String nombre=request.getParameter("nombre");

 //----------------VARIABLES------------//
   Connection mi_conexion=null;
   Statement mi_estado=null;
   PreparedStatement mi_estado1=null;
   ResultSet mi_resultado=null;
   
   try{
   Class.forName("com.mysql.jdbc.Driver");
    
   //---------------CONEXION---------------//
   mi_conexion=DriverManager.getConnection("jdbc:mysql://localhost:3306/alumnos","root","");
   
  
   //----CREASION DE OBJETO STATEMENT------// 
   
   mi_estado=mi_conexion.createStatement();
    
   
  //--------------SENTENCIA SQL------------//
   
   String consulta="SELECT * FROM datos WHERE nombre='"+nombre+"'";
   
   
   //--------EJECUSION DE CONSULTA-----------//
   
   mi_resultado=mi_estado.executeQuery(consulta);
   
   //-------RECORRIDO DEL RESULTSET-----------//
   
   while(mi_resultado.next()){



     %>



 
  <table>
	 <form action="" method="">
	 
	 <tr>
	 <td>Nombre</td> <td><input type="text" name="nombre" value="<%=mi_resultado.getString(1)%>"></td>
	 </tr>
	 
	 <tr>
	 <td>Apellidos</td> <td><input type="text" name="apellido" value="<%=mi_resultado.getString(2)%>"></td>
	 </tr>
	 
	  <tr>
	 <td>Matricula</td> <td><input type="text" name="matricula" value="<%=mi_resultado.getString(3)%>"></td>
	 </tr>
	 
	  <tr>
	 <td>Id</td> <td><input type="text" name="Id" value="<%=mi_resultado.getString(4)%>"></td>
	 </tr>
	 
	  <tr>
	 <th colspan="2"><input type="submit" name="btn" value="Actualizar"></th>
	 </tr>
	 
	 </form>
	 </table>
	 
	 <%
   }
   }catch(Exception e){
	   e.printStackTrace();
	   }
	   
	   if(request.getParameter("btn")!=null){
		   
	   //---RESCATANDO INFORMACION DEL FORMULARIO---//
		   
	   String nom=request.getParameter("nombre");
	   String ape=request.getParameter("apellido");
	   String mat=request.getParameter("matricula");
	   String id=request.getParameter("Id");
	   
	   //--------------CONSULTA SQL-----------------//
	   
	   String consulta_sql="UPDATE datos SET nombre=?, apellidos=?, matricula=?, id=? WHERE nombre=?";
	   
	   //---CREASION DEL OBJETO PREPAREDSTATEMENT----//
	   
	   mi_estado1=mi_conexion.prepareStatement(consulta_sql);
	   
	   //--------ASIGNACION DE PARAMETROS------------//
	   
	   mi_estado1.setString(1,nom );
	   mi_estado1.setString(2,ape );
	   mi_estado1.setString(3,mat );
	   mi_estado1.setString(4,id );
	   mi_estado1.setString(5, nombre);
	   
	   //--------EJECUSION DE CONSULTA----------------//
	   
	   mi_estado1.execute();
	   
	   RequestDispatcher conexion_jsp=request.getRequestDispatcher("/listado.jsp");
	   conexion_jsp.forward(request,response);
   }
   
	 %>
 
</body>
</html>