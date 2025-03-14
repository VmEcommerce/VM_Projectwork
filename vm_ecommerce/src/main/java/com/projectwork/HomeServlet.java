package com.projectwork;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/")
public class HomeServlet extends HttpServlet {

    
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException
    {
        PrintWriter out = response.getWriter();
        out.println("<h1>Benvenuto</h1>");
        
    }
}
