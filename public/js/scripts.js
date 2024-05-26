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

});