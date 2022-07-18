<template>
    <header>
        <h1>{{ title }}</h1>
        <div>
            <label for="file-upload" class="btn" :style="{ background: color}">
                <i class="fa-solid fa-upload"></i> Choose Subtitle
            </label>
            <Button @file-uploaded="this.$emit('file-uploaded')" id="file-upload" type="file"/>
            <div v-show="downloadReady" style="position: fixed;display: inline-block;" >
                <Button @click="this.$emit('download')" id="download" value="Save as" type="button" color="Green" childclass="btn" style="margin-left: 8px"/>
            </div>  
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