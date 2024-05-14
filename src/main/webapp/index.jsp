<%-- 
    Document   : index
    Created on : 25 mar 2024, 10:40:54 p.m.
    Author     : frane
--%>

<%@page import="Controllers.SexoController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es" class="scroll-smooth">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="./css/output.css">
</head>
<body>
    <header class="bg-[#80BF96] shadow-md">


        <div class="relative top-0 left-0 z-10 container grid justify-center items-center text-center text-white
            md:grid-flow-col md:justify-between py-2">
    
                <h1 class="text-2xl font-bold py-4 md:text-3xl">
                    Sistema de Planillas
                </h1>
        
                <div class="grid grid-flow-col gap-4 md:gap-8">
        
                    <a class="hover:text-slate-200 font-bold" href="index.jsp">Inicio</a>
                    <a class="hover:text-slate-200 font-bold" href="#admin">Administración</a>
                    <a class="hover:text-slate-200 font-bold" href="#catalogos">Catalogos</a>
                    <a class="hover:text-slate-200 font-bold" href="#registros">Registros</a>
                    <a class="hover:text-slate-200 font-bold" href="#reportes">Reportes</a>
        
                </div>
        </div>
            
        <div class="relative py-6 grid md:grid-flow-col md:justify-center space-y-4 overflow-hidden">

            <img class="absolute top-0 left-0 z-0 w-full h-full aspect-square object-cover md:max-h-full" src="assets/header-img.jpg" alt="">  
                
            <div class="relative z-10 space-y-6 py-52">                    
                
                <div class="grid items-center justify-center text-center mx-auto gap-6 md:text-left sm:container">
                    
                    <h2 class="text-3xl font-bold text-white">Gestion inteligente y sencilla de tu empresa</h2>

                    <p class="text-white font-normal text-center md:text-left md:text-xl md:w-3/4">Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt voluptatibus veniam facilis, 
                        aliquam amet maxime alias tempora tempore placeat
                    </p>

                </div>
                
                <div class="grid justify-center md:justify-start">

                    <a class="py-2 px-4 bg-[#80BF96] text-white font-bold text-center rounded-md mx-auto w-full md:max-w-[200px] md:left-10
                    hover:scale-110" href="empresa/empresa_index.jsp">Agregar mi empresa</a>

                </div>

                
            </div>
            
        </div>

    </header>

    <section class="bg-[#f2f2f2]" id="admin">
        
        <div class="container space-y-4 py-4">
            <h1 class="text-3xl font-bold text-center md:text-4xl md:py-4">Administración de la Empresa</h1>
        
            <p class="font-light text-slate-500 text-center">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Earum optio maiores dolores, quod sed nam!</p>
    
            <div class="grid grid-cols-1 md:auto-cols-fr sm:grid-cols-3 gap-4">
    
                <article class="flex flex-col justify-center items-center text-center border-b py-8 space-y-4">

                    <img class="h-40 w-40 aspect-square object-cover rounded-full" src="assets/empleados.jpg" alt="Imagen prrona">

                    <h2 class="text-center font-bold text-xl">Empleados</h2>

                    <a class="bg-[#80BF96] py-4 px-6 font-bold text-white rounded-md flex items-center gap-2 hover:scale-110" 
                    href="empleado/empleado_index.jsp">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="w-4 h-4 fill-white">
                            <title>cog</title><path d="M12,15.5A3.5,3.5 0 0,1 8.5,12A3.5,3.5 0 0,1 12,8.5A3.5,3.5 0 0,1 15.5,12A3.5,3.5 0 0,1 12,15.5M19.43,12.97C19.47,12.65 19.5,12.33 19.5,12C19.5,11.67 19.47,11.34 19.43,11L21.54,9.37C21.73,9.22 21.78,8.95 21.66,8.73L19.66,5.27C19.54,5.05 19.27,4.96 19.05,5.05L16.56,6.05C16.04,5.66 15.5,5.32 14.87,5.07L14.5,2.42C14.46,2.18 14.25,2 14,2H10C9.75,2 9.54,2.18 9.5,2.42L9.13,5.07C8.5,5.32 7.96,5.66 7.44,6.05L4.95,5.05C4.73,4.96 4.46,5.05 4.34,5.27L2.34,8.73C2.21,8.95 2.27,9.22 2.46,9.37L4.57,11C4.53,11.34 4.5,11.67 4.5,12C4.5,12.33 4.53,12.65 4.57,12.97L2.46,14.63C2.27,14.78 2.21,15.05 2.34,15.27L4.34,18.73C4.46,18.95 4.73,19.03 4.95,18.95L7.44,17.94C7.96,18.34 8.5,18.68 9.13,18.93L9.5,21.58C9.54,21.82 9.75,22 10,22H14C14.25,22 14.46,21.82 14.5,21.58L14.87,18.93C15.5,18.67 16.04,18.34 16.56,17.94L19.05,18.95C19.27,19.03 19.54,18.95 19.66,18.73L21.66,15.27C21.78,15.05 21.73,14.78 21.54,14.63L19.43,12.97Z" />
                        </svg>
                        Gestionar
                    </a>

                </article>
    
                <article class="flex flex-col justify-center items-center text-center border-b py-8 space-y-4">

                    <img class="h-40 w-40 aspect-square object-cover rounded-full" src="assets/unidades.jpg" alt="Imagen prrona">

                    <h2 class="text-center font-bold text-xl">Unidades Organizativas</h2>
                    
                    <a class="bg-[#80BF96] py-4 px-6 font-bold text-white rounded-md flex items-center gap-2 hover:scale-110" 
                    href="unidadorganizativa/unidadorganizativa_index.jsp">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="w-4 h-4 fill-white">
                            <title>cog</title><path d="M12,15.5A3.5,3.5 0 0,1 8.5,12A3.5,3.5 0 0,1 12,8.5A3.5,3.5 0 0,1 15.5,12A3.5,3.5 0 0,1 12,15.5M19.43,12.97C19.47,12.65 19.5,12.33 19.5,12C19.5,11.67 19.47,11.34 19.43,11L21.54,9.37C21.73,9.22 21.78,8.95 21.66,8.73L19.66,5.27C19.54,5.05 19.27,4.96 19.05,5.05L16.56,6.05C16.04,5.66 15.5,5.32 14.87,5.07L14.5,2.42C14.46,2.18 14.25,2 14,2H10C9.75,2 9.54,2.18 9.5,2.42L9.13,5.07C8.5,5.32 7.96,5.66 7.44,6.05L4.95,5.05C4.73,4.96 4.46,5.05 4.34,5.27L2.34,8.73C2.21,8.95 2.27,9.22 2.46,9.37L4.57,11C4.53,11.34 4.5,11.67 4.5,12C4.5,12.33 4.53,12.65 4.57,12.97L2.46,14.63C2.27,14.78 2.21,15.05 2.34,15.27L4.34,18.73C4.46,18.95 4.73,19.03 4.95,18.95L7.44,17.94C7.96,18.34 8.5,18.68 9.13,18.93L9.5,21.58C9.54,21.82 9.75,22 10,22H14C14.25,22 14.46,21.82 14.5,21.58L14.87,18.93C15.5,18.67 16.04,18.34 16.56,17.94L19.05,18.95C19.27,19.03 19.54,18.95 19.66,18.73L21.66,15.27C21.78,15.05 21.73,14.78 21.54,14.63L19.43,12.97Z" />
                        </svg>
                        Gestionar
                    </a>

                </article>

                <article class="flex flex-col justify-center items-center text-center border-b py-8 space-y-4">

                    <img class="h-40 w-40 aspect-square object-cover rounded-full" src="assets/departamentos.jpg" alt="Imagen prrona">

                    <h2 class="text-center font-bold text-xl">Departamentos Unidades Organizativas</h2>
                    
                    <a class="bg-[#80BF96] py-4 px-6 font-bold text-white rounded-md flex items-center gap-2 hover:scale-110" 
                    href="depunidadorganizativa/depuni_index.jsp">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="w-4 h-4 fill-white">
                            <title>cog</title><path d="M12,15.5A3.5,3.5 0 0,1 8.5,12A3.5,3.5 0 0,1 12,8.5A3.5,3.5 0 0,1 15.5,12A3.5,3.5 0 0,1 12,15.5M19.43,12.97C19.47,12.65 19.5,12.33 19.5,12C19.5,11.67 19.47,11.34 19.43,11L21.54,9.37C21.73,9.22 21.78,8.95 21.66,8.73L19.66,5.27C19.54,5.05 19.27,4.96 19.05,5.05L16.56,6.05C16.04,5.66 15.5,5.32 14.87,5.07L14.5,2.42C14.46,2.18 14.25,2 14,2H10C9.75,2 9.54,2.18 9.5,2.42L9.13,5.07C8.5,5.32 7.96,5.66 7.44,6.05L4.95,5.05C4.73,4.96 4.46,5.05 4.34,5.27L2.34,8.73C2.21,8.95 2.27,9.22 2.46,9.37L4.57,11C4.53,11.34 4.5,11.67 4.5,12C4.5,12.33 4.53,12.65 4.57,12.97L2.46,14.63C2.27,14.78 2.21,15.05 2.34,15.27L4.34,18.73C4.46,18.95 4.73,19.03 4.95,18.95L7.44,17.94C7.96,18.34 8.5,18.68 9.13,18.93L9.5,21.58C9.54,21.82 9.75,22 10,22H14C14.25,22 14.46,21.82 14.5,21.58L14.87,18.93C15.5,18.67 16.04,18.34 16.56,17.94L19.05,18.95C19.27,19.03 19.54,18.95 19.66,18.73L21.66,15.27C21.78,15.05 21.73,14.78 21.54,14.63L19.43,12.97Z" />
                        </svg>
                        Gestionar
                    </a>

                </article>

                <article class="flex flex-col justify-center items-center text-center border-b py-8 space-y-4">

                    <img class="h-40 w-40 aspect-square object-cover rounded-full" src="assets/areas.jpg" alt="Imagen prrona">

                    <h2 class="text-center font-bold text-xl">Areas Unidades Organizativas</h2>
                    
                    <a class="bg-[#80BF96] py-4 px-6 font-bold text-white rounded-md flex items-center gap-2 hover:scale-110" 
                    href="areaunidadorganizativa/areauni_index.jsp">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="w-4 h-4 fill-white">
                            <title>cog</title><path d="M12,15.5A3.5,3.5 0 0,1 8.5,12A3.5,3.5 0 0,1 12,8.5A3.5,3.5 0 0,1 15.5,12A3.5,3.5 0 0,1 12,15.5M19.43,12.97C19.47,12.65 19.5,12.33 19.5,12C19.5,11.67 19.47,11.34 19.43,11L21.54,9.37C21.73,9.22 21.78,8.95 21.66,8.73L19.66,5.27C19.54,5.05 19.27,4.96 19.05,5.05L16.56,6.05C16.04,5.66 15.5,5.32 14.87,5.07L14.5,2.42C14.46,2.18 14.25,2 14,2H10C9.75,2 9.54,2.18 9.5,2.42L9.13,5.07C8.5,5.32 7.96,5.66 7.44,6.05L4.95,5.05C4.73,4.96 4.46,5.05 4.34,5.27L2.34,8.73C2.21,8.95 2.27,9.22 2.46,9.37L4.57,11C4.53,11.34 4.5,11.67 4.5,12C4.5,12.33 4.53,12.65 4.57,12.97L2.46,14.63C2.27,14.78 2.21,15.05 2.34,15.27L4.34,18.73C4.46,18.95 4.73,19.03 4.95,18.95L7.44,17.94C7.96,18.34 8.5,18.68 9.13,18.93L9.5,21.58C9.54,21.82 9.75,22 10,22H14C14.25,22 14.46,21.82 14.5,21.58L14.87,18.93C15.5,18.67 16.04,18.34 16.56,17.94L19.05,18.95C19.27,19.03 19.54,18.95 19.66,18.73L21.66,15.27C21.78,15.05 21.73,14.78 21.54,14.63L19.43,12.97Z" />
                        </svg>
                        Gestionar
                    </a>

                </article>

                <article class="flex flex-col justify-center items-center text-center border-b py-8 space-y-4">

                    <img class="h-40 w-40 aspect-square object-cover rounded-full" src="assets/secciones.jpg" alt="Imagen prrona">

                    <h2 class="text-center font-bold text-xl">Secciones Unidades Organizativas</h2>
                    
                    <a class="bg-[#80BF96] py-4 px-6 font-bold text-white rounded-md flex items-center gap-2 hover:scale-110" 
                    href="seccionesunidadorganizativa/secuni_index.jsp">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="w-4 h-4 fill-white">
                            <title>cog</title><path d="M12,15.5A3.5,3.5 0 0,1 8.5,12A3.5,3.5 0 0,1 12,8.5A3.5,3.5 0 0,1 15.5,12A3.5,3.5 0 0,1 12,15.5M19.43,12.97C19.47,12.65 19.5,12.33 19.5,12C19.5,11.67 19.47,11.34 19.43,11L21.54,9.37C21.73,9.22 21.78,8.95 21.66,8.73L19.66,5.27C19.54,5.05 19.27,4.96 19.05,5.05L16.56,6.05C16.04,5.66 15.5,5.32 14.87,5.07L14.5,2.42C14.46,2.18 14.25,2 14,2H10C9.75,2 9.54,2.18 9.5,2.42L9.13,5.07C8.5,5.32 7.96,5.66 7.44,6.05L4.95,5.05C4.73,4.96 4.46,5.05 4.34,5.27L2.34,8.73C2.21,8.95 2.27,9.22 2.46,9.37L4.57,11C4.53,11.34 4.5,11.67 4.5,12C4.5,12.33 4.53,12.65 4.57,12.97L2.46,14.63C2.27,14.78 2.21,15.05 2.34,15.27L4.34,18.73C4.46,18.95 4.73,19.03 4.95,18.95L7.44,17.94C7.96,18.34 8.5,18.68 9.13,18.93L9.5,21.58C9.54,21.82 9.75,22 10,22H14C14.25,22 14.46,21.82 14.5,21.58L14.87,18.93C15.5,18.67 16.04,18.34 16.56,17.94L19.05,18.95C19.27,19.03 19.54,18.95 19.66,18.73L21.66,15.27C21.78,15.05 21.73,14.78 21.54,14.63L19.43,12.97Z" />
                        </svg>
                        Gestionar
                    </a>

                </article>

                <article class="flex flex-col justify-center items-center text-center border-b py-8 space-y-4">

                    <img class="h-40 w-40 aspect-square object-cover rounded-full" src="assets/subsecciones.jpg" alt="Imagen prrona">

                    <h2 class="text-center font-bold text-xl">Subsecciones Unidades Organizativas</h2>
                    
                    <a class="bg-[#80BF96] py-4 px-6 font-bold text-white rounded-md flex items-center gap-2 hover:scale-110" 
                    href="SubSeccion/SubSecc_index.jsp">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="w-4 h-4 fill-white">
                            <title>cog</title><path d="M12,15.5A3.5,3.5 0 0,1 8.5,12A3.5,3.5 0 0,1 12,8.5A3.5,3.5 0 0,1 15.5,12A3.5,3.5 0 0,1 12,15.5M19.43,12.97C19.47,12.65 19.5,12.33 19.5,12C19.5,11.67 19.47,11.34 19.43,11L21.54,9.37C21.73,9.22 21.78,8.95 21.66,8.73L19.66,5.27C19.54,5.05 19.27,4.96 19.05,5.05L16.56,6.05C16.04,5.66 15.5,5.32 14.87,5.07L14.5,2.42C14.46,2.18 14.25,2 14,2H10C9.75,2 9.54,2.18 9.5,2.42L9.13,5.07C8.5,5.32 7.96,5.66 7.44,6.05L4.95,5.05C4.73,4.96 4.46,5.05 4.34,5.27L2.34,8.73C2.21,8.95 2.27,9.22 2.46,9.37L4.57,11C4.53,11.34 4.5,11.67 4.5,12C4.5,12.33 4.53,12.65 4.57,12.97L2.46,14.63C2.27,14.78 2.21,15.05 2.34,15.27L4.34,18.73C4.46,18.95 4.73,19.03 4.95,18.95L7.44,17.94C7.96,18.34 8.5,18.68 9.13,18.93L9.5,21.58C9.54,21.82 9.75,22 10,22H14C14.25,22 14.46,21.82 14.5,21.58L14.87,18.93C15.5,18.67 16.04,18.34 16.56,17.94L19.05,18.95C19.27,19.03 19.54,18.95 19.66,18.73L21.66,15.27C21.78,15.05 21.73,14.78 21.54,14.63L19.43,12.97Z" />
                        </svg>
                        Gestionar
                    </a>

                </article>

            </div>
        </div>

    </section>

    <section class="bg-[#e1f2d5]" id="catalogos">
        
        <div class="container space-y-4 py-4">
            <h1 class="text-3xl font-bold text-center md:text-4xl md:py-4 text-[#63a77b]">Gestion de Catalogos</h1>
        
            <p class="font-light text-slate-800 text-center">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Earum optio maiores dolores, quod sed nam!</p>
    
            <div class="grid grid-cols-1 md:auto-cols-fr sm:grid-cols-4 gap-4">
    
                <article class="flex flex-col justify-center items-center text-center border-b py-8 space-y-4">

                    <img class="h-40 w-40 aspect-square object-cover rounded-full" src="assets/puestos.jpg" alt="Imagen prrona">

                    <h2 class="text-center font-bold text-xl">Puestos</h2>

                    <a class="bg-[#80BF96] py-4 px-6 font-bold text-white rounded-md flex items-center gap-2 hover:scale-110" 
                    href="puesto/puesto_index.jsp">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="w-4 h-4 fill-white">
                            <title>cog</title><path d="M12,15.5A3.5,3.5 0 0,1 8.5,12A3.5,3.5 0 0,1 12,8.5A3.5,3.5 0 0,1 15.5,12A3.5,3.5 0 0,1 12,15.5M19.43,12.97C19.47,12.65 19.5,12.33 19.5,12C19.5,11.67 19.47,11.34 19.43,11L21.54,9.37C21.73,9.22 21.78,8.95 21.66,8.73L19.66,5.27C19.54,5.05 19.27,4.96 19.05,5.05L16.56,6.05C16.04,5.66 15.5,5.32 14.87,5.07L14.5,2.42C14.46,2.18 14.25,2 14,2H10C9.75,2 9.54,2.18 9.5,2.42L9.13,5.07C8.5,5.32 7.96,5.66 7.44,6.05L4.95,5.05C4.73,4.96 4.46,5.05 4.34,5.27L2.34,8.73C2.21,8.95 2.27,9.22 2.46,9.37L4.57,11C4.53,11.34 4.5,11.67 4.5,12C4.5,12.33 4.53,12.65 4.57,12.97L2.46,14.63C2.27,14.78 2.21,15.05 2.34,15.27L4.34,18.73C4.46,18.95 4.73,19.03 4.95,18.95L7.44,17.94C7.96,18.34 8.5,18.68 9.13,18.93L9.5,21.58C9.54,21.82 9.75,22 10,22H14C14.25,22 14.46,21.82 14.5,21.58L14.87,18.93C15.5,18.67 16.04,18.34 16.56,17.94L19.05,18.95C19.27,19.03 19.54,18.95 19.66,18.73L21.66,15.27C21.78,15.05 21.73,14.78 21.54,14.63L19.43,12.97Z" />
                        </svg>
                        Gestionar
                    </a>

                </article>
    
                <article class="flex flex-col justify-center items-center text-center border-b py-8 space-y-4">

                    <img class="h-40 w-40 aspect-square object-cover rounded-full" src="assets/profesiones.jpg" alt="Imagen prrona">

                    <h2 class="text-center font-bold text-xl">Profesiones</h2>
                    
                    <a class="bg-[#80BF96] py-4 px-6 font-bold text-white rounded-md flex items-center gap-2 hover:scale-110" 
                    href="profesion/profesion_index.jsp">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="w-4 h-4 fill-white">
                            <title>cog</title><path d="M12,15.5A3.5,3.5 0 0,1 8.5,12A3.5,3.5 0 0,1 12,8.5A3.5,3.5 0 0,1 15.5,12A3.5,3.5 0 0,1 12,15.5M19.43,12.97C19.47,12.65 19.5,12.33 19.5,12C19.5,11.67 19.47,11.34 19.43,11L21.54,9.37C21.73,9.22 21.78,8.95 21.66,8.73L19.66,5.27C19.54,5.05 19.27,4.96 19.05,5.05L16.56,6.05C16.04,5.66 15.5,5.32 14.87,5.07L14.5,2.42C14.46,2.18 14.25,2 14,2H10C9.75,2 9.54,2.18 9.5,2.42L9.13,5.07C8.5,5.32 7.96,5.66 7.44,6.05L4.95,5.05C4.73,4.96 4.46,5.05 4.34,5.27L2.34,8.73C2.21,8.95 2.27,9.22 2.46,9.37L4.57,11C4.53,11.34 4.5,11.67 4.5,12C4.5,12.33 4.53,12.65 4.57,12.97L2.46,14.63C2.27,14.78 2.21,15.05 2.34,15.27L4.34,18.73C4.46,18.95 4.73,19.03 4.95,18.95L7.44,17.94C7.96,18.34 8.5,18.68 9.13,18.93L9.5,21.58C9.54,21.82 9.75,22 10,22H14C14.25,22 14.46,21.82 14.5,21.58L14.87,18.93C15.5,18.67 16.04,18.34 16.56,17.94L19.05,18.95C19.27,19.03 19.54,18.95 19.66,18.73L21.66,15.27C21.78,15.05 21.73,14.78 21.54,14.63L19.43,12.97Z" />
                        </svg>
                        Gestionar
                    </a>

                </article>

                <article class="flex flex-col justify-center items-center text-center border-b py-8 space-y-4">

                    <img class="h-40 w-40 aspect-square object-cover rounded-full" src="assets/ingresos.jpg" alt="Imagen prrona">

                    <h2 class="text-center font-bold text-xl">Tipos de Ingreso</h2>
                    
                    <a class="bg-[#80BF96] py-4 px-6 font-bold text-white rounded-md flex items-center gap-2 hover:scale-110" 
                    href="tipoingreso/tipoingreso_index.jsp">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="w-4 h-4 fill-white">
                            <title>cog</title><path d="M12,15.5A3.5,3.5 0 0,1 8.5,12A3.5,3.5 0 0,1 12,8.5A3.5,3.5 0 0,1 15.5,12A3.5,3.5 0 0,1 12,15.5M19.43,12.97C19.47,12.65 19.5,12.33 19.5,12C19.5,11.67 19.47,11.34 19.43,11L21.54,9.37C21.73,9.22 21.78,8.95 21.66,8.73L19.66,5.27C19.54,5.05 19.27,4.96 19.05,5.05L16.56,6.05C16.04,5.66 15.5,5.32 14.87,5.07L14.5,2.42C14.46,2.18 14.25,2 14,2H10C9.75,2 9.54,2.18 9.5,2.42L9.13,5.07C8.5,5.32 7.96,5.66 7.44,6.05L4.95,5.05C4.73,4.96 4.46,5.05 4.34,5.27L2.34,8.73C2.21,8.95 2.27,9.22 2.46,9.37L4.57,11C4.53,11.34 4.5,11.67 4.5,12C4.5,12.33 4.53,12.65 4.57,12.97L2.46,14.63C2.27,14.78 2.21,15.05 2.34,15.27L4.34,18.73C4.46,18.95 4.73,19.03 4.95,18.95L7.44,17.94C7.96,18.34 8.5,18.68 9.13,18.93L9.5,21.58C9.54,21.82 9.75,22 10,22H14C14.25,22 14.46,21.82 14.5,21.58L14.87,18.93C15.5,18.67 16.04,18.34 16.56,17.94L19.05,18.95C19.27,19.03 19.54,18.95 19.66,18.73L21.66,15.27C21.78,15.05 21.73,14.78 21.54,14.63L19.43,12.97Z" />
                        </svg>
                        Gestionar
                    </a>

                </article>

                <article class="flex flex-col justify-center items-center text-center border-b py-8 space-y-4">

                    <img class="h-40 w-40 aspect-square object-cover rounded-full" src="assets/egresos.jpg" alt="Imagen prrona">

                    <h2 class="text-center font-bold text-xl">Tipos de Egreso</h2>
                    
                    <a class="bg-[#80BF96] py-4 px-6 font-bold text-white rounded-md flex items-center gap-2 hover:scale-110" 
                    href="tipodescuento/tipodescuento_index.jsp">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="w-4 h-4 fill-white">
                            <title>cog</title><path d="M12,15.5A3.5,3.5 0 0,1 8.5,12A3.5,3.5 0 0,1 12,8.5A3.5,3.5 0 0,1 15.5,12A3.5,3.5 0 0,1 12,15.5M19.43,12.97C19.47,12.65 19.5,12.33 19.5,12C19.5,11.67 19.47,11.34 19.43,11L21.54,9.37C21.73,9.22 21.78,8.95 21.66,8.73L19.66,5.27C19.54,5.05 19.27,4.96 19.05,5.05L16.56,6.05C16.04,5.66 15.5,5.32 14.87,5.07L14.5,2.42C14.46,2.18 14.25,2 14,2H10C9.75,2 9.54,2.18 9.5,2.42L9.13,5.07C8.5,5.32 7.96,5.66 7.44,6.05L4.95,5.05C4.73,4.96 4.46,5.05 4.34,5.27L2.34,8.73C2.21,8.95 2.27,9.22 2.46,9.37L4.57,11C4.53,11.34 4.5,11.67 4.5,12C4.5,12.33 4.53,12.65 4.57,12.97L2.46,14.63C2.27,14.78 2.21,15.05 2.34,15.27L4.34,18.73C4.46,18.95 4.73,19.03 4.95,18.95L7.44,17.94C7.96,18.34 8.5,18.68 9.13,18.93L9.5,21.58C9.54,21.82 9.75,22 10,22H14C14.25,22 14.46,21.82 14.5,21.58L14.87,18.93C15.5,18.67 16.04,18.34 16.56,17.94L19.05,18.95C19.27,19.03 19.54,18.95 19.66,18.73L21.66,15.27C21.78,15.05 21.73,14.78 21.54,14.63L19.43,12.97Z" />
                        </svg>
                        Gestionar
                    </a>

                </article>

            </div>
        </div>

    </section>

    <section class="bg-[#A4BF88]" id="registros">
        
        <div class="container space-y-4 py-4">
            <h1 class="text-3xl font-bold text-center md:text-4xl md:py-4 text-[#f2f2f2]">Registro de movimientos salariales</h1>
        
            <p class="font-light text-white text-center">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Earum optio maiores dolores, quod sed nam!</p>
    
            <div class="grid grid-cols-1 md:auto-cols-fr sm:grid-cols-3 gap-4">
    
                <article class="flex flex-col justify-center items-center text-center py-8 space-y-4">

                    <img class="h-40 w-40 aspect-square object-cover rounded-full" src="assets/presupuesos.jpg" alt="Imagen prrona">

                    <h2 class="text-center font-bold text-xl text-white">Presupuesto</h2>

                    <a class="bg-[#80BF96] py-4 px-6 font-bold text-white rounded-md flex items-center gap-2 hover:scale-110" 
                    href="presupuesto/presupuesto_index.jsp">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="w-4 h-4 fill-white">
                            <title>cog</title><path d="M12,15.5A3.5,3.5 0 0,1 8.5,12A3.5,3.5 0 0,1 12,8.5A3.5,3.5 0 0,1 15.5,12A3.5,3.5 0 0,1 12,15.5M19.43,12.97C19.47,12.65 19.5,12.33 19.5,12C19.5,11.67 19.47,11.34 19.43,11L21.54,9.37C21.73,9.22 21.78,8.95 21.66,8.73L19.66,5.27C19.54,5.05 19.27,4.96 19.05,5.05L16.56,6.05C16.04,5.66 15.5,5.32 14.87,5.07L14.5,2.42C14.46,2.18 14.25,2 14,2H10C9.75,2 9.54,2.18 9.5,2.42L9.13,5.07C8.5,5.32 7.96,5.66 7.44,6.05L4.95,5.05C4.73,4.96 4.46,5.05 4.34,5.27L2.34,8.73C2.21,8.95 2.27,9.22 2.46,9.37L4.57,11C4.53,11.34 4.5,11.67 4.5,12C4.5,12.33 4.53,12.65 4.57,12.97L2.46,14.63C2.27,14.78 2.21,15.05 2.34,15.27L4.34,18.73C4.46,18.95 4.73,19.03 4.95,18.95L7.44,17.94C7.96,18.34 8.5,18.68 9.13,18.93L9.5,21.58C9.54,21.82 9.75,22 10,22H14C14.25,22 14.46,21.82 14.5,21.58L14.87,18.93C15.5,18.67 16.04,18.34 16.56,17.94L19.05,18.95C19.27,19.03 19.54,18.95 19.66,18.73L21.66,15.27C21.78,15.05 21.73,14.78 21.54,14.63L19.43,12.97Z" />
                        </svg>
                        Asignar
                    </a>

                </article>
    
                <article class="flex flex-col justify-center items-center text-center py-8 space-y-4">

                    <img class="h-40 w-40 aspect-square object-cover rounded-full" src="assets/ganancias.jpg" alt="Imagen prrona">

                    <h2 class="text-center font-bold text-xl text-white">Ingresos</h2>
                    
                    <a class="bg-[#80BF96] py-4 px-6 font-bold text-white rounded-md flex items-center gap-2 hover:scale-110" 
                    href="#">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="w-4 h-4 fill-white">
                            <title>cog</title><path d="M12,15.5A3.5,3.5 0 0,1 8.5,12A3.5,3.5 0 0,1 12,8.5A3.5,3.5 0 0,1 15.5,12A3.5,3.5 0 0,1 12,15.5M19.43,12.97C19.47,12.65 19.5,12.33 19.5,12C19.5,11.67 19.47,11.34 19.43,11L21.54,9.37C21.73,9.22 21.78,8.95 21.66,8.73L19.66,5.27C19.54,5.05 19.27,4.96 19.05,5.05L16.56,6.05C16.04,5.66 15.5,5.32 14.87,5.07L14.5,2.42C14.46,2.18 14.25,2 14,2H10C9.75,2 9.54,2.18 9.5,2.42L9.13,5.07C8.5,5.32 7.96,5.66 7.44,6.05L4.95,5.05C4.73,4.96 4.46,5.05 4.34,5.27L2.34,8.73C2.21,8.95 2.27,9.22 2.46,9.37L4.57,11C4.53,11.34 4.5,11.67 4.5,12C4.5,12.33 4.53,12.65 4.57,12.97L2.46,14.63C2.27,14.78 2.21,15.05 2.34,15.27L4.34,18.73C4.46,18.95 4.73,19.03 4.95,18.95L7.44,17.94C7.96,18.34 8.5,18.68 9.13,18.93L9.5,21.58C9.54,21.82 9.75,22 10,22H14C14.25,22 14.46,21.82 14.5,21.58L14.87,18.93C15.5,18.67 16.04,18.34 16.56,17.94L19.05,18.95C19.27,19.03 19.54,18.95 19.66,18.73L21.66,15.27C21.78,15.05 21.73,14.78 21.54,14.63L19.43,12.97Z" />
                        </svg>
                        Registrar
                    </a>

                </article>

                <article class="flex flex-col justify-center items-center text-center py-8 space-y-4">

                    <img class="h-40 w-40 aspect-square object-cover rounded-full" src="assets/descuentos.jpg" alt="Imagen prrona">

                    <h2 class="text-center font-bold text-xl text-white">Descuentos</h2>
                    
                    <a class="bg-[#80BF96] py-4 px-6 font-bold text-white rounded-md flex items-center gap-2 hover:scale-110" 
                    href="descuento/descuento_index.jsp">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="w-4 h-4 fill-white">
                            <title>cog</title><path d="M12,15.5A3.5,3.5 0 0,1 8.5,12A3.5,3.5 0 0,1 12,8.5A3.5,3.5 0 0,1 15.5,12A3.5,3.5 0 0,1 12,15.5M19.43,12.97C19.47,12.65 19.5,12.33 19.5,12C19.5,11.67 19.47,11.34 19.43,11L21.54,9.37C21.73,9.22 21.78,8.95 21.66,8.73L19.66,5.27C19.54,5.05 19.27,4.96 19.05,5.05L16.56,6.05C16.04,5.66 15.5,5.32 14.87,5.07L14.5,2.42C14.46,2.18 14.25,2 14,2H10C9.75,2 9.54,2.18 9.5,2.42L9.13,5.07C8.5,5.32 7.96,5.66 7.44,6.05L4.95,5.05C4.73,4.96 4.46,5.05 4.34,5.27L2.34,8.73C2.21,8.95 2.27,9.22 2.46,9.37L4.57,11C4.53,11.34 4.5,11.67 4.5,12C4.5,12.33 4.53,12.65 4.57,12.97L2.46,14.63C2.27,14.78 2.21,15.05 2.34,15.27L4.34,18.73C4.46,18.95 4.73,19.03 4.95,18.95L7.44,17.94C7.96,18.34 8.5,18.68 9.13,18.93L9.5,21.58C9.54,21.82 9.75,22 10,22H14C14.25,22 14.46,21.82 14.5,21.58L14.87,18.93C15.5,18.67 16.04,18.34 16.56,17.94L19.05,18.95C19.27,19.03 19.54,18.95 19.66,18.73L21.66,15.27C21.78,15.05 21.73,14.78 21.54,14.63L19.43,12.97Z" />
                        </svg>
                        Registrar
                    </a>

                </article>

            </div>
        </div>

    </section>

    <section class="bg-[#ffffff]" id="reportes">
        
        <div class="container space-y-4 py-8">
            <h1 class="text-3xl font-bold text-center md:text-4xl md:py-4 text-[#6d8a4e]">Reportes Disponibles</h1>
        
            <p class="font-light text-[#6d8a4e] text-center">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Earum optio maiores dolores, quod sed nam!</p>

            <div class="flex flex-col md:flex-row gap-8 flex-wrap text-center justify-center py-8 px-8 border-b-2 border-[#A4BF88]">
                <a class="text-xl font-bold text-[#A4BF88] hover:text-[#6d8a4e]" href="#">Reporte 1</a>
                <a class="text-xl font-bold text-[#A4BF88] hover:text-[#6d8a4e]" href="#">Reporte 2</a>
                <a class="text-xl font-bold text-[#A4BF88] hover:text-[#6d8a4e]" href="#">Reporte 3</a>
                <a class="text-xl font-bold text-[#A4BF88] hover:text-[#6d8a4e]" href="#">Reporte 4</a>
            </div>

        </div>

    </section>

    <footer class="bg-[#80BF96]">
        
        <div class="container space-y-4 py-4">
            <div class="grid md:grid-flow-col items-center md:justify-between">

                <h1 class="text-xl font-bold text-center md:text-2xl md:py-4 text-white">Sistema de Planillas</h1>

                <div class="grid text-center text-white font-medium md:grid-flow-col gap-4 py-4">
                    <a class="hover:text-slate-200 font-bold" href="index.jsp">Inicio</a>
                    <a class="hover:text-slate-200 font-bold" href="#admin">Administración</a>
                    <a class="hover:text-slate-200 font-bold" href="#catalogos">Catalogos</a>
                    <a class="hover:text-slate-200 font-bold" href="#registros">Registros</a>
                    <a class="hover:text-slate-200 font-bold" href="#reportes">Reportes</a>
                </div>
            
            </div>
            
            <hr>
            <div class="grid grid-flow-col justify-between">

                <img src="assets/logoBAD.png" alt="" class="w-16 h-16 aspect-square object-cover">

                <h2 class="text-white font-semibold">BAD115 - 2024 - Francisco Escobar / Bella Rodriguez / Juan Montes &copy; </h2>
            </div>

        </div>

    </footer>
    </body>
</html>
