<template>
    <input id="input" @change="this.$emit('file-uploaded')" type="file" :style="{ background: color}" class="btn">
</template>

<script>
export default {
    name: 'Button',
    props:{
        text: String,
        color: String,
    },
    emits: ['file-uploaded'],
}
</script>