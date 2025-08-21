// NeTa Shop JavaScript Functions

// DOM Elements
const productCards = document.querySelectorAll('.product-card');
const navLinks = document.querySelectorAll('.nav-menu a');
const categoryLinks = document.querySelectorAll('.category-list a');

// Initialize when DOM is loaded
document.addEventListener('DOMContentLoaded', function() {
    initializeProductCards();
    initializeNavigation();
    initializeCategoryFilter();
    addScrollEffects();
});

// Product card interactions
function initializeProductCards() {
    productCards.forEach(card => {
        // Add hover effect enhancement
        card.addEventListener('mouseenter', function() {
            this.style.boxShadow = '0 5px 20px rgba(0,0,0,0.2)';
        });

        card.addEventListener('mouseleave', function() {
            this.style.boxShadow = '0 2px 10px rgba(0,0,0,0.1)';
        });

        // Click event for product cards
        card.addEventListener('click', function() {
            const productTitle = this.querySelector('.product-title').textContent;
            console.log(`Clicked on: ${productTitle}`);
            // Add your product detail navigation logic here
        });
    });
}

// Navigation functionality
function initializeNavigation() {
    navLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            
            // Remove active class from all links
            navLinks.forEach(l => l.classList.remove('active'));
            
            // Add active class to clicked link
            this.classList.add('active');
            
            const linkText = this.textContent;
            console.log(`Navigated to: ${linkText}`);
            
            // Add your navigation logic here
        });
    });
}

// Category filter functionality
function initializeCategoryFilter() {
    categoryLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            
            // Remove active class from all category links
            categoryLinks.forEach(l => l.classList.remove('active'));
            
            // Add active class to clicked link
            this.classList.add('active');
            
            const category = this.textContent;
            filterProductsByCategory(category);
        });
    });
}

// Filter products by category
function filterProductsByCategory(category) {
    console.log(`Filtering by category: ${category}`);
    
    productCards.forEach(card => {
        // Add fade out effect
        card.style.opacity = '0.3';
        
        // Simulate filtering (you can add real filter logic here)
        setTimeout(() => {
            card.style.opacity = '1';
        }, 300);
    });
    
    // Show loading effect
    showLoadingEffect();
}

// Loading effect
function showLoadingEffect() {
    const productGrid = document.querySelector('.product-grid');
    productGrid.style.opacity = '0.5';
    
    setTimeout(() => {
        productGrid.style.opacity = '1';
    }, 600);
}

// Scroll effects
function addScrollEffects() {
    const header = document.querySelector('.header');
    let lastScrollTop = 0;
    
    window.addEventListener('scroll', function() {
        const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
        
        if (scrollTop > lastScrollTop) {
            // Scrolling down
            header.style.transform = 'translateY(-100%)';
        } else {
            // Scrolling up
            header.style.transform = 'translateY(0)';
        }
        
        lastScrollTop = scrollTop;
    });
    
    // Add transition to header
    header.style.transition = 'transform 0.3s ease';
}

// Product rating interaction
document.querySelectorAll('.product-rating').forEach(rating => {
    rating.addEventListener('click', function(e) {
        if (e.target.classList.contains('star')) {
            const stars = this.querySelectorAll('.star');
            const clickedIndex = Array.from(stars).indexOf(e.target);
            
            // Update rating display
            stars.forEach((star, index) => {
                if (index <= clickedIndex) {
                    star.classList.remove('empty');
                } else {
                    star.classList.add('empty');
                }
            });
            
            console.log(`Rated ${clickedIndex + 1} stars`);
        }
    });
});

// Search functionality (if you add a search box)
function searchProducts(searchTerm) {
    const products = document.querySelectorAll('.product-card');
    
    products.forEach(product => {
        const title = product.querySelector('.product-title').textContent.toLowerCase();
        const description = product.querySelector('.product-description').textContent.toLowerCase();
        
        if (title.includes(searchTerm.toLowerCase()) || description.includes(searchTerm.toLowerCase())) {
            product.style.display = 'block';
        } else {
            product.style.display = 'none';
        }
    });
}

// Utility functions
function formatPrice(price) {
    return new Intl.NumberFormat('vi-VN', {
        style: 'currency',
        currency: 'VND'
    }).format(price);
}

function addToCart(productId) {
    console.log(`Added product ${productId} to cart`);
    // Add your cart logic here
}

// Export functions for external use
window.NetaShop = {
    searchProducts,
    filterProductsByCategory,
    addToCart,
    formatPrice
};