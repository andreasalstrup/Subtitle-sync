<template>
    <fieldset id="sub-container" class="inner-container" :style="downloadReady ? 'opacity: 1' : 'opacity 0.5'" :key="group[0][0]" v-for="group in subtitle">
        <legend>{{ group[0] }}</legend>
        <h3>Start Time</h3>
            <input 
                :id="`start-${group[0][0]}`" 
                @focus="this.$emit('before-time', $event.target.value)" 
                @change="this.$emit('after-time', $event.target.value)" 
                :value="group[1]"
                :style="downloadReady ? '' : 'pointer-events:none;'">
        <h3>End Time</h3>
            <input 
                :id="`end-${group[0][0]}`" 
                @focus="this.$emit('before-time', $event.target.value)" 
                @change="this.$emit('after-time', $event.target.value)" 
                :value="group[3]"
                :style="downloadReady ? '' : 'pointer-events:none;'">
        <h3>{{ group[4] }}</h3>
    </fieldset>
</template>

<script>
export default {
    name: 'Subtitle',
    props: {
        subtitle: Object,
        downloadReady: Boolean,
    },
    emits: ['before-time', 'after-time'],
}
</script>