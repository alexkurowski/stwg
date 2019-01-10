document.addEventListener('turbolinks:load', function () {
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


  document.addEventListener('keyup', function (event) {
    if (event.keyCode === 27 && lightbox) {
      removeLightbox();
    }
  });

  document.addEventListener('click', function (event) {
    if (event.target.dataset.hasOwnProperty('lightbox')) {
      lightbox = createLightbox(event.target);
    }
  });
});
