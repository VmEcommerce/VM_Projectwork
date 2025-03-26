<%@ page language="java" contentType="text/html; charset=UTF-8" 
import="java.io.*, projectwork.*, projectwork.entities.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>VM_Music</title>
  <!-- Link a Bootstrap (per il layout) -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
  <link rel="stylesheet" href="/style.css">
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
<body>
  <!-- Navbar fissa a sinistra -->
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

  <!-- Sezione principale con l'immagine che occupa tutto lo schermo e si posiziona sotto la navbar -->
  <main class="home">
    <img src="https://imgur.com/CNAyTNI.jpg" alt="Home Image">
  </main>

 
  
  <!-- Script di Bootstrap (necessario per il funzionamento della navbar) -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
