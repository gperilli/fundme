// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

/*!
* Start Bootstrap - Grayscale v7.0.5 (https://startbootstrap.com/theme/grayscale)
* Copyright 2013-2022 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-grayscale/blob/master/LICENSE)
*/
//
// Scripts
// 

window.addEventListener('DOMContentLoaded', event => {

  // Navbar shrink function
  var navbarShrink = function () {
    const navbarCollapsible = document.body.querySelector('#top-nav-bar');
    if (!navbarCollapsible) {
      return;
    }
    if (window.scrollY === 0) {
      navbarCollapsible.classList.remove('navbar-shrink')
      navbarCollapsible.classList.remove('white')
      navbarCollapsible.classList.add('trans')
    } else {
      navbarCollapsible.classList.add('navbar-shrink')
      navbarCollapsible.classList.remove('trans')
      navbarCollapsible.classList.add('white')
    }
  };

  // Shrink the navbar 
  navbarShrink();

  // Shrink the navbar when page is scrolled
  document.addEventListener('scroll', navbarShrink);

  // Activate Bootstrap scrollspy on the main nav element
  const topNavBar = document.body.querySelector('#top-nav-bar');
  if (topNavBar) {
    new bootstrap.ScrollSpy(document.body, {
      target: '#top-nav-bar',
      offset: 74,
    });
  };

  // Collapse responsive navbar when toggler is visible
  const navbarToggler = document.body.querySelector('.navbar-toggler');
  const responsiveNavItems = [].slice.call(
      document.querySelectorAll('#navbarResponsive .nav-link')
  );
  responsiveNavItems.map(function (responsiveNavItem) {
      responsiveNavItem.addEventListener('click', () => {
        if (window.getComputedStyle(navbarToggler).display !== 'none') {
          navbarToggler.click(); 
        }
      });
  });

  let navbarOpen = false
  const navbarFade = function () {
    const navbarCollapsible = document.body.querySelector('#top-nav-bar');
      
    // Open from transparent state st top
    if (window.scrollY === 0 && navbarOpen == false) {
      navbarCollapsible.classList.add('white')
      navbarCollapsible.classList.remove('trans')
      //navbarOpen = 1
    } else if (window.scrollY === 0 && navbarOpen == true)  {
      navbarCollapsible.classList.add('trans')
      navbarCollapsible.classList.remove('white')
      //navbarOpen = 1
    } 
    navbarOpen = !navbarOpen;
  }
  document.querySelector('.navbar-toggler').addEventListener('click', navbarFade);
  dropMenus();
});


function dropMenus() {
    const langDropDownBtn = document.getElementsByClassName("dropdown-button");
    const ddNavDropDownMenus = document.getElementsByClassName("ddNavDropDownMenus");
    
    // 
    langDropDownBtn[0].addEventListener("click", (event) => {
        ddNavDropDownMenus[0].classList.toggle("show");
    });
    langDropDownBtn[0].addEventListener("mouseenter", (event) => {
        ddNavDropDownMenus[0].classList.add("show");
    });

    langDropDownBtn[0].addEventListener("mouseleave", (event) => {
        ddNavDropDownMenus[0].classList.remove("show");
    });

    ddNavDropDownMenus[0].addEventListener("mouseenter", (event) => {
        ddNavDropDownMenus[0].classList.add("show");
    });
    ddNavDropDownMenus[0].addEventListener("mouseleave", (event) => {
        ddNavDropDownMenus[0].classList.remove("show");
    });


    langDropDownBtn[1].addEventListener("click", (event) => {
        ddNavDropDownMenus[1].classList.toggle("show");
    });
    langDropDownBtn[1].addEventListener("mouseenter", (event) => {
        ddNavDropDownMenus[1].classList.add("show");
    });
    langDropDownBtn[1].addEventListener("mouseleave", (event) => {
        ddNavDropDownMenus[1].classList.remove("show");
    });


    ddNavDropDownMenus[1].addEventListener("mouseenter", (event) => {
        ddNavDropDownMenus[1].classList.add("show");
    });
    ddNavDropDownMenus[1].addEventListener("mouseleave", (event) => {
        ddNavDropDownMenus[1].classList.remove("show");
    });

}

// Close the dropdown if the user clicks outside of it
window.onclick = function (event) {
  if (!event.target.matches('.ro-button-useroptions-cssdropbtn')) {
    var dropdowns = document.getElementsByClassName("ro-button-useroptions-cssdropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
      openDropdown.classList.remove('show');
      }
    }
  }
}
