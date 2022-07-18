<template>
    <input :id="id" @change="this.$emit('file-uploaded')" :value="value" :type="type" :style="{ background: color}" :class="childclass">
</template>

<script>
export default {
    name: 'Button',
    props:{
        id: String,
        childclass: String,
        value: String,
        color: String,
        type: String,
    },
    emits: ['file-uploaded'],
}
</script>