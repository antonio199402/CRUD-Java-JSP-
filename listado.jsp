<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
	h1{
	margin-left:250px;
	}
	
	.cabecera{
	color:#286bb7;
	background-color:#c1fcfa;
	   
	}
	
	table{
	margin-left:50px;
	border:solid 2px #064543;
	width:870px;
	}
	
	
	</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
	
</head>

<body>
  <h1 class="alineado" >ALUMNOS REGISTRADOS</h1>
  <!-- Cabecera de la tabla -->
  <table>
  <tr>
  <th class="cabecera" colspan="4">=Datos de alumnos registrados= </th>
  <td class="cabecera"><a href="formulario.jsp"><img src="imagenes/agregar.jpg" width=60></a></td>
  
  </tr>
  <tr>  
    <td class="cabecera">Nombre</td> <td class="cabecera">Apellidos</td>
     <td class="cabecera">Matricula</td> <td class="cabecera">Id </td> 
     <td class="cabecera">Accion</td>
  </tr>
 
  <!-- Conexion con base de datos -->
  
  <%
  //----------------VARIABLES------------//
  Connection mi_conexion=null;
  Statement mi_estado=null;
  ResultSet mi_resultado=null;
  
  try{
  Class.forName("com.mysql.jdbc.Driver");
   
  //---------------CONEXION---------------//
  mi_conexion=DriverManager.getConnection("jdbc:mysql://localhost:3306/alumnos","root","");
  
  //--------CREASION DE OBJETO STATMENT---//
  
  mi_estado=mi_conexion.createStatement();
  
  //--------------SENTENCIA SQL------------//
  
  String consulta="SELECT * FROM datos";
  
  //--------EJECUSION DE CONSULTA-----------//
  
  mi_resultado=mi_estado.executeQuery(consulta);
  
  //-------RECORRIDO DEL RESULTSET-----------//
  
  while(mi_resultado.next()){
	  
	  %> 
	  <tr>
	  <td><%=mi_resultado.getString(1)%></td> <td><%=mi_resultado.getString(2)%></td>
	  
	  <td><%=mi_resultado.getString(3)%></td> <td><%=mi_resultado.getString(4)%></td>
	  
	  <td><a href="eliminar.jsp?nombre=<%=mi_resultado.getString(1)%>"><img src="imagenes/eliminar.jpg" width=40></a>
	  
	  
	  
	 <a href="actualizar.jsp?nombre=<%=mi_resultado.getString(1)%>"><img src="imagenes/actualizar.jpg" width=40></a></td>
	  </tr>
	  
	  <% 
	  
  }
  
  }catch(Exception e){
	  e.printStackTrace();
  }
  %>
  
  </table>
</body>
</html>