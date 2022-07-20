<template>
    <label :for="id" :class="childclass" :style="{ background: color}">
        <i :class="icon"></i> {{ value }}
    </label>
    <input :id="id" :type="type" @change="this.$emit('file-uploaded')" @click="this.$emit('download')" style="display: none">
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
        icon: String,
    },
    emits: ['file-uploaded', 'download'],
}
</script>