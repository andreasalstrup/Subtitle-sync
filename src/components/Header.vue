<template>
    <header>
        <h1>{{ title }}</h1>
        <div>
            <Button 
                @file-uploaded="this.$emit('file-uploaded')" 
                childclass="btn p-2 m-2"
                type="file" 
                id="file-upload" 
                value="Choose Subtitle" 
                icon="fa-solid fa-upload"
                :color="color"/>
            <div v-show="downloadReady" style="position: fixed;display: inline-block;" >
                <Button 
                    @download="this.$emit('download')"
                    childclass="btn p-2 m-2"
                    type="button" 
                    id="download" 
                    value="Save as" 
                    icon="fa-solid fa-save"
                    color="Green"/>
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