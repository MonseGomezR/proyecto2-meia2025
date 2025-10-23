<template>
    <footer class="footer">
        <div class="footer-content">
            <div class="footer-section">
                <h4>About Us</h4>
                <p>Your trusted online store for quality products.</p>
            </div>
            <div class="footer-section">
                <h4>Contact</h4>
                <p>Email: contact@example.com</p>
                <p>Phone: (123) 456-7890</p>
            </div>
            <div class="footer-section">
                <h4>Follow Us</h4>
                <div class="social-links">
                    <a href="#">Facebook</a>
                    <a href="#">Twitter</a>
                    <a href="#">Instagram</a>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2023 Your Store. All rights reserved.</p>
        </div>
    </footer>
</template>

<script>
export default {
    name: 'Footer'
}
</script>

<style scoped>
.footer {
    background-color: #333;
    color: white;
    padding: 2rem 0;
    margin-top: 2rem;
}

.footer-content {
    max-width: 1200px;
    margin: 0 auto;
    display: flex;
    justify-content: space-around;
    flex-wrap: wrap;
    padding: 0 1rem;
}

.footer-section {
    margin: 1rem;
    min-width: 250px;
}

.footer-section h4 {
    margin-bottom: 1rem;
}

.social-links a {
    color: white;
    text-decoration: none;
    margin-right: 1rem;
}

.social-links a:hover {
    text-decoration: underline;
}

.footer-bottom {
    text-align: center;
    margin-top: 2rem;
    padding-top: 1rem;
    border-top: 1px solid #555;
}
</style>