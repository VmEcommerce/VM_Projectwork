package com.projectwork;

import java.io.PrintWriter;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HomeServlet extends HttpServlet {

    public static void main(String[] args) {
    
    }
    
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException
    {
        PrintWriter out = response.getWriter();
        out.println("<h1>Benvenuto</h1>");
        
    }
}
