const readCollapse = () => {
  const description = document.querySelector("#description");
  let link = document.querySelector('#read-more')
  const hide = document.querySelector('#read-less')

  const readMore = () => {
    if (description && link && hide) {
      link.addEventListener('click', (event) => {
        event.preventDefault()
        const text = description.innerHTML
        description.innerHTML = description.dataset.text
        description.setAttribute("data-text", text)
        hide.classList.remove('d-none')
      })
    }
  }

  const readLess = () => {
    if (description && link && hide) {
      hide.addEventListener('click', (event) => {
        event.preventDefault()
        const text = description.innerHTML
        description.innerHTML = description.dataset.text
        description.setAttribute("data-text", text)
        hide.classList.add('d-none')
        description.scrollIntoView({block: "center"})
        link = document.querySelector('#read-more')
        readMore()
      })
    }
  }
  readMore();
  readLess();
}  

export { readCollapse }