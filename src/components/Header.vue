<template>
    <header>
        <h1>{{ title }}</h1>
        <Button @file-uploaded="this.$emit('file-uploaded')" text="Choose subtitle" :color="color"/>
    </header>
</template>

<script>
import Button from './Button.vue'

export default {
    name: 'Header',
    props: {
        title: String,
        color: String,
    },
    components: {
        Button,
    },
    emits: ['file-uploaded'],
}
</script>

<style scoped>
header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}
</style>