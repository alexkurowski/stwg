window.addEventListener('load', function () {
  let lightbox;

  function createLightbox(original) {
    const wrapper = document.createElement('div');
    wrapper.classList.add('lightbox');
    wrapper.style.opacity = '0';
    wrapper.addEventListener('click', removeLightbox);

    const image = document.createElement('img');
    image.src = original.src;

    wrapper.appendChild(image);
    document.body.appendChild(wrapper);

    setTimeout(function () {
      wrapper.style.opacity = '1';
    }, 100);

    return wrapper;
  }

  function removeLightbox() {
    if (lightbox) {
      lightbox.remove();
      lightbox = null;
    }
  }


  document.addEventListener('keyup', event => {
    if (event.keyCode === 27 && lightbox) {
      removeLightbox();
    }
  });

  document.addEventListener('click', event => {
    if (event.target.dataset.hasOwnProperty('lightbox')) {
      lightbox = createLightbox(event.target);
    }
  });


  const projects = document.querySelectorAll('.projects > li');
  projects.forEach(project => {
    console.log(project);
  });
});
