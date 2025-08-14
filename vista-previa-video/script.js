let videos = document.querySelectorAll("video");

videos.forEach((video) => {
    // console.dir(video)
    video.onmouseenter = reproducir;
    video.addEventListener("mouseleave", pausar)
});

function reproducir() {
    this.play();
}

function pausar() {
    this.pause();
}