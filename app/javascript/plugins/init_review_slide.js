const reviewSlide = () => {
  const slide = document.querySelector('#review-slide')
  
  slide.addEventListener('click', (event) => {
    event.preventDefault()
    const text = slide.innerHTML
    slide.innerHTML = slide.dataset.text
    slide.setAttribute("data-text", text)
  });
};

export { reviewSlide }