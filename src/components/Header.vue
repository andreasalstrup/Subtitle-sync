<template>
    <header>
        <div id="center">
            <h1>{{ title }}</h1>
            <h5>Offset edit made easy</h5>
        </div>
    </header>
</template>

<script>

export default {
    name: 'Header',
    props: {
        title: String,
        value: String,
        color: String,
        downloadReady: Boolean,
    },
}
</script>

<style scoped>
header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}
#center {
   text-align: center;
}
</style>