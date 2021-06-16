const initSidebar = () => {
  const nav = document.getElementById("mySidenav");

  const openNav = () => {
    nav.style.width = "500px";
  }
  
  const closeNav = () => {
    nav.style.width = "0px";
  }

  const burger = document.querySelector('.burger-dropdown');
  const close = document.querySelector('.closebtn');

  burger.addEventListener('click', (event) => {
    openNav();
  });
  
  close.addEventListener('click', (event) => {
    closeNav();
  });
};

export { initSidebar };