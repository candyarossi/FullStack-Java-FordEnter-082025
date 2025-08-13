document.addEventListener("DOMContentLoaded", function () {

    let videos = document.querySelectorAll("video");

    function reproducir() {
        this.play();
    }

    function pausar() {
        this.pause();
    }

    videos.forEach((video) => {
        // console.dir(video)

        video.onmouseenter = reproducir;

        video.addEventListener("mouseleave", pausar)
    });
})

