<%@ page language="java" contentType="text/html; charset=UTF-8" 
import="java.io.*, projectwork.*, projectwork.entities.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VM_Music</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
    <style>
        :root {
            --bg-dark: #121212;  /* Colore di sfondo scuro */
            --bg-light: #white; /* Colore di sfondo leggermente più chiaro */
            --text-light: #261041; /* Colore del testo chiaro */
            --text-muted: #B0B0B0; /* Colore del testo meno intenso */
        }
        
        
        .home {
            min-height: 100vh; /* Occupa tutta l'altezza della viewport */
            overflow-y: auto; /* Permette lo scroll solo del contenuto */
        }
        
        .navbarCustom{
            height: 100%;
            position: sticky;
        }
        
        .fixed-left {
            position: fixed;
            top: 0;
            left: 0;
            width: 250px; /* Larghezza della sidebar */
            background-color: #f8f9fa; /* Colore di sfondo */
            border-right: 1px solid #ddd;
        }
        
        body {
            margin-left: 250px; /* Spazio per il contenuto */
        }
        
        .colorBody{
            background-color: var(--bg-light);
        }
        
        .textColor{
            color: var(--text-light);
        }
        
        
            /* Immagine che occupa tutta la finestra e parte sotto la navbar */
            main.home img {
              width: 100%;        /* L'immagine prende tutta la larghezza */
              height: 100%;       /* L'immagine prende tutta l'altezza */
              object-fit: cover;  /* L'immagine si adatta senza distorsioni */
              max-width: 100%;    /* Assicura che l'immagine non vada oltre la larghezza */
              max-height: 100%;   /* Assicura che l'immagine non vada oltre l'altezza */
              position: absolute;
              top: 0;
              left: 0;
              z-index: -99;
            }
            /* Navbar a sinistra */
            nav {
              position: fixed;
              height: 100vh;
              top: 0;
              left: 0;
              width: 200px;
            }
            .navbar-nav {
              margin-top: 50px;
            }
            .navbar-nav .nav-link {
              padding-left: 15px;
            }
          </style>
</head>
<body  >
    <nav class="navbar navbar-expand-lg  fixed-left vh-100 align-items-start ps-5 bg-transparent border-0">
        <div class="container-fluid d-flex flex-column align-items-start p-2 pt-3">
          <a class="navbar-brand textColor mb-5 " href="http://localhost:8080/vm-music"><img style="height: 5rem;" src="https://imgur.com/V6jrTA0.png" alt=""></a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" 
              aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          
          <div class="collapse navbar-collapse show" id="navbarSupportedContent">
            <ul class="navbar-nav flex-column w-100">
              <li class="nav-item">
                <a class="nav-link textColor fs-4" aria-current="page" href="http://localhost:8080/vm-music"> <i class="bi bi-house textColor"></i> Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link textColor fs-4" href="http://localhost:8080/vm-music/tracks"><i class="bi bi-file-music-fill textColor"></i> Novità</a>
              </li>
              <li class="nav-item">
                <a class="nav-link textColor fs-4" href="http://localhost:8080/vm-music/tracks/track"><i class="bi bi-music-note-beamed textColor" ></i> Tutti i brani</a>
              </li>
              <li class="nav-item">
                <a class="nav-link textColor fs-4" href="http://localhost:8080/vm-music/carrello"><i class="bi bi-cart-plus textColor"></i> Carrello</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <main class="home">
         <div class="container ">
            <div class="row">
                <div class="col-12 mt-5">
                    <h1 class="textColor">Carrello</h1>
                    <hr class="textColor">
                </div>
            <div>
              <c:choose>
                <c:when test="${empty carrello}">
                  <tr>
                    <td colspan="6" class="text-center position-relative mt-5">
                        <div class="d-flex justify-content-center align-items-center ">
                            <h2 class="textColor display-3 position-absolute top-50 start-50">Il carrello è vuoto</h2>
                        </div>
                    </td>
                  </tr>
                </c:when>
                <c:otherwise>
            <div class="container ">
                <div class="row">
                    <div class="col-12 mt-5 ">
                        <table class="table  ">
                            <thead class="">
                              <tr>
                                <th class="textColor" scope="col">Brano</th>
                                <th class="textColor" scope="col">Artista</th>
                                <th class="textColor" scope="col">Genere musicale</th>
                                <th class="textColor" scope="col">Durata</th>
                                <th class="textColor" scope="col">Prezzo</th>
                                <th class="textColor" scope="col">Elimina</th>
                              </tr>
                            </thead>
                            <tbody>
                              <c:forEach var="track" items="${carrello}">
                              <tr>
                                
                                <td>${track.trackName}</td>
                                <td>${track.artistName}</td>
                                <td>${track.genre}</td>
                                <td>${track.duration}m</td>
                                <td>${track.price}€</td>
                                <td>
                                  <form action="carrello" method="post">
                                      <input type="hidden" name="trackName" value="${track.trackName}"> <!-- Passa il nome della traccia -->
                                      <input type="hidden" name="action" value="delete"> <!-- Indica che questa è un'azione di eliminazione -->
                                      <button type="submit" class="btn btn-link p-0">
                                        <i class="bi bi-trash3 fs-4 textColor"></i> <!-- Icona del carrello -->
                                    </button>
                                   </form>
                                </td>
                              </tr>
                            </c:forEach>

                            </tbody>
                          </table>
                          <div class="d-flex justify-content-between mt-5">
                            
                            <form action="carrello" method="post">
                              <input type="hidden" name="action" value="clear"> <!-- Azione per svuotare il carrello -->
                              <button type="submit" class="btn btn-link p-0">
                                <i class="bi bi-trash3 fs-4 textColor">Svuota il carrello</i> <!-- Icona del carrello -->
                              </button>
                            </form>
                            <h3 class="textColor">Totale: €${totale}</h3>
                          </div>
                        
                    </div>
                <div>
                </c:otherwise>
              </c:choose>
          </div>
        </main>
                

        <footer>
          <div class="text-end me-5">
                <p>Copyright 2025 <b>VM_Music Inc.</b> Tutti i direitti riservati.</p>
          </div>
      </footer>
   





    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>