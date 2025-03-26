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
.tableImg {
    display: block !important;
    width: auto !important;
    height: auto !important;
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
<body >
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
                    <h1 class="textColor">Novità</h1>
                    <hr class="textColor">
                 </div>
              <div>
          </div>
          <div class="container p-0 mt-5" >
            <div id="carouselExample" class="carousel slide" data-bs-ride="carousel" >
                <div class="carousel-inner" >
                    <!-- Prima slide con tre card -->
                    <div class="carousel-item active">
                        <div class="row justify-content-center">
                            <c:forEach var="track" items="${tracks}" begin="170" end="172">
                                <div class="col-12 col-md-4 mb-4">
                                    <div class="d-flex justify-content-between">
                                        <div>
                                            <h5 class="card-title textColor">${track.trackName}</h5>
                                            <h6 class="card-subtitle mb-2 textColor">${track.artistName}</h6>
                                            <p class="card-link textColor">${track.genere_Musicale}</p>
                                        </div>
                                        
                                        <form action="carrello" method="post">
                                            <input type="hidden" name="action" value="add">
                                            <input type="hidden" name="trackId" value="${track._id}">
                                            <input type="hidden" name="trackName" value="${track.trackName}">
                                            <input type="hidden" name="artistName" value="${track.artistName}">
                                            <input type="hidden" name="genre" value="${track.genere_Musicale}">
                                            <input type="hidden" name="duration" value="${track.durata}">
                                            <input type="hidden" name="price" value="${track.prezzo}">
                                            <button type="submit" class="btn btn-link p-0">
                                                <i class="bi bi-cart-plus fs-4 textColor"></i>
                                            </button>
                                        </form>

                                    </div>
                                    <div class="card colorBody border-0"  style="width: 100%;height: 25rem;">
                                        <div class="card-body">
                                            <img src="${track.FOTO}" class="rounded-3" alt="Track Image">
                                            <div class="card-img-overlay d-flex justify-content-between align-items-end">
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
        
                    <!-- Seconda slide con tre card -->
                    <div class="carousel-item ">
                        <div class="row justify-content-center">
                            <c:forEach var="track" items="${tracks}" begin="36" end="38">
                                <div class="col-12 col-md-4 mb-4">
                                    <div class="d-flex justify-content-between">
                                        <div>
                                            <h5 class="card-title textColor">${track.trackName}</h5>
                                            <h6 class="card-subtitle mb-2 textColor">${track.artistName}</h6>
                                            <p class="card-link textColor">${track.genere_Musicale}</p>
                                        </div>
                                        
                                        <form action="carrello" method="post">
                                            <input type="hidden" name="action" value="add">
                                            <input type="hidden" name="trackId" value="${track._id}">
                                            <input type="hidden" name="trackName" value="${track.trackName}">
                                            <input type="hidden" name="artistName" value="${track.artistName}">
                                            <input type="hidden" name="genre" value="${track.genere_Musicale}">
                                            <input type="hidden" name="duration" value="${track.durata}">
                                            <input type="hidden" name="price" value="${track.prezzo}">
                                            <button type="submit" class="btn btn-link p-0">
                                                <i class="bi bi-cart-plus fs-4 textColor"></i>
                                            </button>
                                        </form>

                                    </div>
                                    <div class="card colorBody border-0"  style="width: 100%;height: 25rem;">
                                        <div class="card-body">
                                            <img src="${track.FOTO}" class="rounded-3" alt="Track Image">
                                            <div class="card-img-overlay d-flex justify-content-between align-items-end">
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
        
                    <!-- Terza slide con tre card -->
                    <div class="carousel-item ">
                        <div class="row justify-content-center">
                            <c:forEach var="track" items="${tracks}" begin="25" end="27">
                                <div class="col-12 col-md-4 mb-4">
                                    <div class="d-flex justify-content-between">
                                        <div>
                                            <h5 class="card-title textColor">${track.trackName}</h5>
                                            <h6 class="card-subtitle mb-2 textColor">${track.artistName}</h6>
                                            <p class="card-link textColor">${track.genere_Musicale}</p>
                                        </div>
                                        
                                        <form action="carrello" method="post">
                                            <input type="hidden" name="action" value="add">
                                            <input type="hidden" name="trackId" value="${track._id}">
                                            <input type="hidden" name="trackName" value="${track.trackName}">
                                            <input type="hidden" name="artistName" value="${track.artistName}">
                                            <input type="hidden" name="genre" value="${track.genere_Musicale}">
                                            <input type="hidden" name="duration" value="${track.durata}">
                                            <input type="hidden" name="price" value="${track.prezzo}">
                                            <button type="submit" class="btn btn-link p-0">
                                                <i class="bi bi-cart-plus fs-4 textColor"></i>
                                            </button>
                                        </form>

                                    </div>
                                    <div class="card colorBody border-0"  style="width: 100%;height: 25rem;">
                                        <div class="card-body">
                                            <img src="${track.FOTO}" class="rounded-3" alt="Track Image">
                                            <div class="card-img-overlay d-flex justify-content-between align-items-end">
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                <!-- Pulsanti di navigazione -->
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
        
          
          
          
     <div class="container mt-5 mb-5">

      <div class="row">
          <div class="mb-3">
              <h3><a class="textColor" href="">Playlist</a></h3> 
          </div>
  
          <!-- Prima card -->
          <div class="col-3">
              <div class="card border border-0" style="width: 20rem;">
                  <ul class="list-group list-group-flush">
                    <c:forEach var="track" items="${tracks}" begin="9" end="12">
                      <li class="list-group-item colorBody textColor d-flex align-items-center justify-content-between">
                        <div>
                            <span class="flex-grow-1 ">${track.trackName}</span>
                            <p class="flex-grow-1">${track.artistName}</p>
                        </div>
                        
                          <form action="carrello" method="post">
                            <input type="hidden" name="action" value="add"> <!-- Azione per aggiungere -->
                            <input type="hidden" name="trackId" value="${track._id}">
                            <input type="hidden" name="trackName" value="${track.trackName}">
                            <input type="hidden" name="artistName" value="${track.artistName}">
                            <input type="hidden" name="genre" value="${track.genere_Musicale}">
                            <input type="hidden" name="duration" value="${track.durata}">
                            <input type="hidden" name="price" value="${track.prezzo}">
                            <button type="submit" class="btn btn-link p-0">
                                <i class="bi bi-cart-plus fs-4 textColor"></i> <!-- Icona del carrello -->
                            </button>
                        </form>
                      </li>
                    </c:forEach>
                      
                  </ul>
              </div>
          </div>
  
          <!-- Seconda card -->
          <div class="col-3">
              <div class="card border border-0" style="width: 20rem;">
                  <ul class="list-group list-group-flush">
                    <c:forEach var="track" items="${tracks}" begin="13" end="16">
                        <li class="list-group-item colorBody textColor d-flex align-items-center justify-content-between">
                            <div>
                                <span class="flex-grow-1 ">${track.trackName}</span>
                                <p class="flex-grow-1">${track.artistName}</p>
                            </div>
                            <form action="carrello" method="post">
                                <input type="hidden" name="action" value="add"> <!-- Azione per aggiungere -->
                                <input type="hidden" name="trackId" value="${track._id}">
                                <input type="hidden" name="trackName" value="${track.trackName}">
                                <input type="hidden" name="artistName" value="${track.artistName}">
                                <input type="hidden" name="genre" value="${track.genere_Musicale}">
                                <input type="hidden" name="duration" value="${track.durata}">
                                <input type="hidden" name="price" value="${track.prezzo}">
                                <button type="submit" class="btn btn-link p-0">
                                    <i class="bi bi-cart-plus fs-4 textColor"></i> <!-- Icona del carrello -->
                                </button>
                            </form>
                        </li>
                      </c:forEach>
                  </ul>
              </div>
          </div>
  
          <!-- Terza card -->
          <div class="col-3">
              <div class="card border border-0" style="width: 20rem;">
                  <ul class="list-group list-group-flush">
                    <c:forEach var="track" items="${tracks}" begin="17" end="20">
                        <li class="list-group-item colorBody textColor d-flex align-items-center justify-content-between">
                            <div>
                                <span class="flex-grow-1 ">${track.trackName}</span>
                                <p class="flex-grow-1">${track.artistName}</p>
                            </div>
                            <form action="carrello" method="post">
                                <input type="hidden" name="action" value="add"> <!-- Azione per aggiungere -->
                                <input type="hidden" name="trackId" value="${track._id}">
                                <input type="hidden" name="trackName" value="${track.trackName}">
                                <input type="hidden" name="artistName" value="${track.artistName}">
                                <input type="hidden" name="genre" value="${track.genere_Musicale}">
                                <input type="hidden" name="duration" value="${track.durata}">
                                <input type="hidden" name="price" value="${track.prezzo}">
                                <button type="submit" class="btn btn-link p-0">
                                    <i class="bi bi-cart-plus fs-4 textColor"></i> <!-- Icona del carrello -->
                                </button>
                            </form>
                        </li>
                      </c:forEach>
                  </ul>
              </div>
          </div>
  
          <!-- Quarta card -->
          <div class="col-3">
              <div class="card border border-0" style="width: 20rem;">
                  <ul class="list-group list-group-flush">
                    <c:forEach var="track" items="${tracks}" begin="21" end="24">
                        <li class="list-group-item  textColor d-flex align-items-center justify-content-between">
                            <div>
                                <span class="flex-grow-1 ">${track.trackName}</span>
                                <p class="flex-grow-1">${track.artistName}</p>
                            </div>
                            <form action="carrello" method="post">
                                <input type="hidden" name="action" value="add"> <!-- Azione per aggiungere -->
                                <input type="hidden" name="trackId" value="${track._id}">
                                <input type="hidden" name="trackName" value="${track.trackName}">
                                <input type="hidden" name="artistName" value="${track.artistName}">
                                <input type="hidden" name="genre" value="${track.genere_Musicale}">
                                <input type="hidden" name="duration" value="${track.durata}">
                                <input type="hidden" name="price" value="${track.prezzo}">
                                <button type="submit" class="btn btn-link p-0">
                                    <i class="bi bi-cart-plus fs-4 textColor"></i> <!-- Icona del carrello -->
                                </button>
                            </form>
                        </li>
                      </c:forEach>
                  </ul>
              </div>
          </div>
  
      </div>
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