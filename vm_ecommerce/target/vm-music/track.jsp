<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
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
            --bg-dark: #121212;  
            --bg-light: #ffffff; 
            --text-light: #261041; 
            --text-muted: #B0B0B0; 
        }

        .home {
            min-height: 100vh;
            overflow-y: auto;
        }

        .navbarCustom{
            height: 100%;
            position: sticky;
        }

        .fixed-left {
            position: fixed;
            top: 0;
            left: 0;
            width: 250px;
            background-color: #f8f9fa;
            border-right: 1px solid #ddd;
        }

        body {
            margin-left: 250px;
        }

        .colorBody{
            background-color: var(--bg-light);
        }

        .textColor{
            color: var(--text-light);
        }

        .card-img-container {
            width: 100%;
            height: 200px; /* Limita l'altezza dell'immagine */
            overflow: hidden;
        }

        .card-img-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .card-body {
            padding: 1rem;
        }

        .card-body p {
            margin: 0.5rem 0;
        }

        .card-body a {
            margin-top: 1rem;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg fixed-left vh-100 align-items-start ps-5 bg-transparent border-0">
        <div class="container-fluid d-flex flex-column align-items-start p-2 pt-3">
            <a class="navbar-brand textColor mb-5" href="http://localhost:8080/vm-music"><img style="height: 5rem;" src="https://imgur.com/V6jrTA0.png" alt=""></a>
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
        <div class="container">
            <div class="row">
                <div class="col-12 mt-5">
                    <h1 class="textColor">Tutti i Brani</h1>
                    <hr class="textColor">
                </div>
            </div>

            <div class="container ms-">
                <div class="row mt-3">
                    <!-- Ciclo per visualizzare le tracce -->
                    <c:forEach var="track" items="${tracks}">
                     
                        <div class="card col-2 m-2 mt-5 border border-0 colorBody" style="width: 15rem; height: 20rem;">
                            <img src="${track.FOTO}" class="card-img-top rounded-3" alt="..." style="height: 15rem; object-fit: cover;width: 100%;">
                            <div class="card-body " style="height: 13rem;">
                                <h5 class="card-text textColor">${track.trackName}</h5>
                                <h6 class="card-text textColor">${track.artistName}</h6>
                                <div class="d-flex justify-content-between">
                                    <p class="card-text textColor">${track.prezzo}€</p>
                                    <form action="${pageContext.request.contextPath}/carrello" method="post">
                                        <input style="display: none;" type="text" name="id" value="${track.get_id()}">
                                        <input type="hidden" name="trackId" value="${track._id}">
                                        <input type="hidden" name="trackName" value="${track.trackName}">
                                        <input type="hidden" name="artistName" value="${track.artistName}">
                                        <input type="hidden" name="genre" value="${track.genere_Musicale}">
                                        <input type="hidden" name="duration" value="${track.durata}">
                                        <input type="hidden" name="price" value="${track.prezzo}">
                                        <button type="submit" name="action" value="add" class="btn btn-link p-0">
                                            <i class="bi bi-cart-plus fs-4 textColor"></i> <!-- Icona del carrello -->
                                        </button>
                                    </form>
                                </div>
                                
                            </div>
                        </div>

                        
                    </c:forEach>
                </div>
            </div>
    </main>

    <footer>
        <div class="text-end me-5">
              <p>Copyright 2025 <b>VM_Music Inc.</b> Tutti i direitti riservati.</p>
        </div>
  </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
