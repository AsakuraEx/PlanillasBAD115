<%-- 
    Document   : login
    Created on : 26 may 2024, 7:01:18 p.m.
    Author     : frane
--%>

<%@page import="org.hibernate.Session"%>
<%@page import="java.util.List"%>
<%@page import="Models.Usuario"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar Sesion</title>
        <link rel="stylesheet" href="./css/output.css">
    </head>
    <body>
        <div class="p-0 md:grid md:grid-flow-col md:grid-cols-2">
            <div class="max-w-full max-h-screen hidden md:block">
                <img class="w-full h-screen aspect-auto object-cover" src="./assets/login.jpg" alt="">
            </div>
            <div class="bg-slate-300 h-screen">
                <div class="flex flex-col justify-center items-center space-y-12">
                    <img class="w-48 mt-8" src="./assets/logoBAD.png" alt="Logo">
                    <h2 class="text-2xl font-bold leading-3 tracking-wide uppercase text-center">Sistema de Planillas</h2>

                    <form action="./login.jsp" method="post" class="bg-white flex flex-col py-12 px-8 rounded-md drop-shadow-lg gap-4">

                        <h1 class="text-2xl font-bold text-center pb-8">Inicio de Sesión</h1>

                        <div class="w-full text-center pb-2 md:text-start">
                            <label for="email">Nombre de usuario</label>
                            <input class="w-full rounded-sm border px-2 py-1" type="text" name="usuario">
                        </div>

                        <div class="w-full text-center pb-2 md:text-start">
                            <label for="password">Contraseña</label>
                            <input class="w-full rounded-sm border px-2 py-1" type="password" name="password">
                        </div>

                        <button type="submit" class="bg-[#80BF96] hover:bg-[#568a68] p-4 text-white font-bold uppercase">Acceder</button>
                        
                        <%
                        if ("POST".equalsIgnoreCase(request.getMethod())) {
                            String usuario = request.getParameter("usuario");
                            String password = request.getParameter("password");
                            String message = "";

                            if (usuario != null && password != null) {
                            SessionFactory sessionFactory = new Configuration().configure().addAnnotatedClass(Usuario.class).buildSessionFactory();
                            Session hsession = sessionFactory.openSession();
                                hsession.beginTransaction();

                                String hql = "FROM Usuario U WHERE U.usuario = :usuario AND U.contrasena = :password";
                                List<Usuario> users = hsession.createQuery(hql)
                                    .setParameter("usuario", usuario)
                                    .setParameter("password", password)
                                    .list();

                                hsession.getTransaction().commit();
                                hsession.close();

                                if (users.size() > 0) {
                                    
                                    Usuario user = users.get(0);
                                
                                    session.setAttribute("usuario", user.getUsuario());
                                    session.setAttribute("rol", user.getRol());
                                    response.sendRedirect("index.jsp");
                                } else {
                                    message = "Usuario o contraseña invalida.";
                                }
                            } else {
                                message = "Por favor ingresa usuario y contraseña.";
                            }
                    %>
                        <p class="text-red-800 text-center"> <%=message %> </p>
                    <%
                        }
                    %>

                    </form>

                    <p>¿No tienes una cuenta? <a class="text-blue-800 hover:text-blue-500" href="./register.jsp">Registrate</a>.</p>

                </div>
            </div>
        </div>        
        
    </body>
</html>
