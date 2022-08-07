<template>
    <footer class="text-end">
        <p>Copyright {{ title }} &copy; 2022</p>
        <router-link to="/about" style="margin: 5px;">About</router-link>
        <router-link to="/contact" style="margin: 5px;">Contact</router-link>
    </footer>
</template>

<script>
export default {
    name: 'Footer',
    props: {
        title: String,
    },
}
</script>

<style scoped>
a {
    color: #333;
}
footer {
    margin-top: 30px;
    text-align: center;
}
</style>