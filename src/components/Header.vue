<template>
    <header>
        <h1>{{ title }}</h1>
        <Button @file-uploaded="this.$emit('file-uploaded')" text="Choose subtitle" type="file" :color="color"/>
        <div v-show="downloadReady">
            <Button @click="this.$emit('download')" value="Download" type="button" color="Green"/>
        </div>
    </header>
</template>

<script>
import Button from './Button.vue'

export default {
    name: 'Header',
    props: {
        title: String,
        value: String,
        color: String,
        downloadReady: Boolean,
    },
    components: {
        Button,
    },
    emits: ['file-uploaded', 'download'],
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