<template>
    <div class="flex justify-between items-center px-8 py-4 bg-gray-800 text-white shadow-md">
        <div class="flex items-center">
            <h2 class="text-2xl font-bold">Admin Panel</h2>
        </div>
        <div class="flex items-center">
            <div class="flex items-center space-x-4">
                <span class="font-medium">Admin User</span>
                <button 
                    @click="handleLogout"
                    class="px-4 py-2 border border-white rounded-md hover:bg-white hover:text-gray-800 transition-colors duration-300"
                >
                    <i class="fas fa-sign-out-alt"></i> Logout
                </button>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: 'TopbarAdmin',
    methods: {
        handleLogout() {
            console.log('Logout clicked')
        }
    }
}
</script>

<style scoped>
.topbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 1rem 2rem;
    background-color: #2c3e50;
    color: white;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.topbar-left {
    display: flex;
    align-items: center;
}

.logo {
    margin: 0;
    font-size: 1.5rem;
}

.topbar-right {
    display: flex;
    align-items: center;
}

.user-info {
    display: flex;
    align-items: center;
    gap: 1rem;
}

.username {
    font-weight: 500;
}

.logout-btn {
    background-color: transparent;
    border: 1px solid white;
    color: white;
    padding: 0.5rem 1rem;
    border-radius: 4px;
    cursor: pointer;
    transition: all 0.3s ease;
}

.logout-btn:hover {
    background-color: white;
    color: #2c3e50;
}
</style>