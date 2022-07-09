<template>
    <div class="container" :key="group[0][0]" v-for="group in subtitle">
        <h3>{{ group[0] }}</h3>
        <h3>Start Time</h3>
            <input :id="`start-${group[0][0]}`" @focus="this.$emit('before-time', $event.target.value)" @change="this.$emit('after-time', $event.target.value)" :value="group[1]">
        <h3>End Time</h3>
            <input :id="`end-${group[0][0]}`" @focus="this.$emit('before-time', $event.target.value)" @change="this.$emit('after-time', $event.target.value)" :value="group[3]">
        <h3>{{ group[4] }}</h3>
    </div>
</template>

<script>
export default {
    name: 'Subtitle',
    props: {
        subtitle: Object
    },
    methods: {
        onChange(event) {
            console.log(event.target.value);
        },
        onFocus(event) {
            console.log(event.target.value);
        }
    },
    emits: ['before-time', 'after-time'],
}
</script>