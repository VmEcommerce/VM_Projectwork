package com.projectwork;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projectwork.entities.Carrello;

@WebServlet("/carrello")
public class CarrelloServlet extends HttpServlet {

    // Lista per tenere traccia degli articoli nel carrello
    private List<Carrello> carrello = new ArrayList<>();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Recupera la lista del carrello dalla sessione
        List<Carrello> carrello = (List<Carrello>) request.getSession().getAttribute("carrello");
    
        // Se la lista del carrello non esiste, inizializzala come una lista vuota
        if (carrello == null) {
            carrello = new ArrayList<>();
        }

        double totale = calcolaTotale(carrello);
    
        // Passa la lista del carrello alla JSP
        request.setAttribute("carrello", carrello);
        request.setAttribute("totale", totale);

    
        // Mostra la pagina del carrello
        request.getRequestDispatcher("/carrello.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String action = request.getParameter("action");
    
        List<Carrello> carrello = (List<Carrello>) request.getSession().getAttribute("carrello");
        if (carrello == null) {
            carrello = new ArrayList<>();
        }
    
        if ("add".equals(action)) {
            String trackId = request.getParameter("trackId");
            String trackName = request.getParameter("trackName");
            String artistName = request.getParameter("artistName");
            String genre = request.getParameter("genre");
            String duration = request.getParameter("duration");
            String price = request.getParameter("price");
    
            price = price.replace(",", ".");
    
            // Controlla se la canzone è già nel carrello
            boolean exists = false;
            for (Carrello item : carrello) {
                if (item.getTrackId().equals(trackId)) { // Confronto basato su trackId
                    exists = true;
                    break;
                }
            }
    
            // Aggiunge solo se non è già presente
            if (!exists) {
                carrello.add(new Carrello(trackId, trackName, artistName, genre, duration, price));
            }
        }
        else if ("delete".equals(action)) {
            String trackNameToDelete = request.getParameter("trackName");
            carrello.removeIf(track -> track.getTrackName().equals(trackNameToDelete));
        }
        else if ("clear".equals(action)) {
            carrello.clear();
        }
    
        request.getSession().setAttribute("carrello", carrello);
    
        // Calcola il totale
        double totale = carrello.stream()
                                .mapToDouble(item -> Double.parseDouble(item.getPrice().replace(",", ".")))
                                .sum();
    
        request.setAttribute("carrello", carrello);
        request.setAttribute("totale", totale);
    
        request.getRequestDispatcher("/carrello.jsp").forward(request, response);
    }
    
    
    
    public double calcolaTotale(List<Carrello> carrello) {
        double totale = 0.0;
        for (Carrello item : carrello) {
            totale += Double.parseDouble(item.getPrice());
        }
        return totale;
    }
    
    
 
}
