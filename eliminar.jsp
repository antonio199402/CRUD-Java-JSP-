<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>

<h1><a href="listado.jsp"> Registro eliminado</a></h1>
<body>

 	 
	 <%
	 
	
	 //-----RESCATAMOS DATOS DEL FORMULARIO--------// 

	String nombre=request.getParameter("nombre");
	 
	 
	 
	 //--------DECLARACION DE VARIABLES--------------//
	 Connection mi_conexion=null;
	 PreparedStatement mi_estado=null;
	 
	 //----CREAMOS BLOQUE TRY CATCH PARA EXCEPCIONES----//
	 
	 try{
	 //-----------CRREAMOS CONEXION-----------------//
	 
	 mi_conexion=DriverManager.getConnection("jdbc:mysql://localhost:3306/alumnos","root","");
	 
	 //-----------CREAMOS CONSULTA-----------------//
	 
	 String consulta="DELETE FROM datos WHERE nombre=?";
	 
	 
	 //-----------CREAMOS STATEMENT-----------------//
	 
	 mi_estado=mi_conexion.prepareStatement(consulta);
	 
	 //-----------ASIGNAMOS PARAMETROS---------------//
	 
	 
	 mi_estado.setString(1, nombre);
	 
	 //------------EJECUTAMOS CONSULTA---------------//
	 
	mi_estado.execute();
	 
    
	 
	 }catch(Exception e){
		 e.printStackTrace();
	 }
	 
	 %>
	 
	 
</body>
</html>