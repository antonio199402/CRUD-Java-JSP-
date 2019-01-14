<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
h1{
  margin-left:200px;
  }
  
table{
  border:solid 3px #b5a342;
 margin-left:120px;
}
 
body{
 background-color:#928749;
  
 }

#informacion{
 float:left;
}
</style>
</head>
<body>
 <h1>AGREGAR NUEVO ALUMNO</h1>
 
	 <table id="informacion">
	 <form action="" method="">
	 <h2>Datos Personales</h2>
	 
	 <tr>
	 <td>Id</td> <td><input type="text" name="Id"></td>
	 </tr>
	 
	 <tr>
	 <td>Matricula</td> <td><input type="text" name="matricula"></td>
	 </tr>
	 
	 <tr>
	 <td>Nombre</td> <td><input type="text" name="nombre"></td>
	 <td>Apellidos</td> <td><input type="text" name="apellido"></td>
	 </tr>
	 
	<tr>
	<td>Direccion</td><td><input type="text" name="dir"></td>
	</tr>
	 
	 
	 
	  <tr>
	 <th colspan="2"><input type="submit" name="btn" value="Registrar"></th>
	 </tr>
	 
	 </form>
	 </table>
	 
	 <table>
	 <form>
	 <h2>Contactos</h2>
	 <tr>
	 <td>Tel Fijo:</td><td><input type="number" name="tel"></td>
	 </tr>
	 
	 <tr>
	 <td>Movil:</td><td><input type="number" name="tel"></td>
	 </tr>
	 
	 <tr>
	 <td>E-mail:</td><td><input type="email" name="tel"></td>
	 </tr>
	 
	 
	 </form>
	 </table>
	 
	 <%
	 
	 if(request.getParameter("btn")!=null){
	 //-----RESCATAMOS DATOS DEL FORMULARIO--------// 
	 String nombre=request.getParameter("nombre");
	 String apellido=request.getParameter("apellido");
	 String matricula=request.getParameter("matricula");
	 String id=request.getParameter("Id");
	 
	 //--------DECLARACION DE VARIABLES--------------//
	 Connection mi_conexion=null;
	 PreparedStatement mi_estado=null;
	 
	 //----CREAMOS BLOQUE TRY CATCH PARA EXCEPCIONES----//
	 
	 try{
	 //-----------CRREAMOS CONEXION-----------------//
	 
	 mi_conexion=DriverManager.getConnection("jdbc:mysql://localhost:3306/alumnos","root","");
	 
	 //-----------CREAMOS CONSULTA-----------------//
	 
	 String consulta="INSERT INTO datos (nombre,apellidos,matricula,id) VALUES(?,?,?,?)";
	 
	 //-----------CREAMOS STATEMENT-----------------//
	 
	 mi_estado=mi_conexion.prepareStatement(consulta);
	 
	 //-----------ASIGNAMOS PARAMETROS---------------//
	 
	 mi_estado.setString(1,nombre);
	 mi_estado.setString(2,apellido);
	 mi_estado.setString(3,matricula);
	 mi_estado.setString(4,id);
	 
	 //------------EJECUTAMOS CONSULTA---------------//
	 
	mi_estado.execute();
	 
    RequestDispatcher conexion_formulario=request.getRequestDispatcher("/listado.jsp");
	 
	 conexion_formulario.forward(request, response);
	 
	 }catch(Exception e){
		 e.printStackTrace();
	 }
	 }
	 %>
	 
	 
</body>
</html>