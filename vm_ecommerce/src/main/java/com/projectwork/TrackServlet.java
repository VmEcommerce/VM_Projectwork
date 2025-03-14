package com.projectwork;

import java.util.List;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.projectwork.entities.Track;
import com.projectwork.services.TrackBi;


@WebServlet("/tracks")
public class TrackServlet extends HttpServlet{

    public List<Track> tracks;

    TrackBi trackList = new TrackBi();

    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException
    {
        
        request.setAttribute("libri", trackList.loadtrack());

        request.getRequestDispatcher("/tracks.jsp").forward(request, response);

    }

}
