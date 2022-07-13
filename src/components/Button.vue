<template>
    <input id="input" @change="this.$emit('file-uploaded')" :value="value" :type="type" :style="{ background: color}" class="btn">
</template>

<script>
export default {
    name: 'Button',
    props:{
        text: String, // slet
        value: String,
        color: String,
        type: String,
    },
    emits: ['file-uploaded'],
}
</script>