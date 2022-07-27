<template>
    <fieldset id="sub-container" class="border p-3 mb-4 rounded border-primary fade-in" :class="downloadReady ? 'opacity-100' : 'opacity-50'" :key="group[0][0]" v-for="group in subtitle">
        <legend class="w-auto"><h1>{{ group[0] }}</h1></legend>
        
        <div class="row p-2">
            <label class="col-sm-3 col-form-label col-form-label-lg" :for="`start-${group[0][0]}`">Start</label>
            <div class="col-sm-8">
                <input :name="`start-${group[0][0]}`"  type="text" class="form-control form-control-lg"
                    :id="`start-${group[0][0]}`" 
                    @focus="this.$emit('before-time', $event.target.value)" 
                    @change="this.$emit('after-time', $event.target.value)" 
                    :value="group[1]"
                    :style="downloadReady ? '' : 'pointer-events:none;'">
                    <Transition>
                    <span v-show="accOffset != 0" class="help-block fade-in" style="color: green;"> 
                        <div v-if="accOffset > 0">+{{ accOffset }} ms</div> 
                        <div v-else>{{ accOffset }} ms</div> 
                    </span>
                    </Transition>
            </div>
        </div>

        <div class="row p-2">
            <label class="col-sm-3 col-form-label col-form-label-lg" :for="`end-${group[0][0]}`">End</label>
            <div class="col-sm-8">
                <input :name="`end-${group[0][0]}`"  type="text" class="form-control form-control-lg"
                    :id="`end-${group[0][0]}`" 
                    @focus="this.$emit('before-time', $event.target.value)" 
                    @change="this.$emit('after-time', $event.target.value)" 
                    :value="group[3]"
                    :style="downloadReady ? '' : 'pointer-events:none;'">
                    <Transition>
                    <span v-show="accOffset != 0" class="help-block fade-in" style="color: green;"> 
                        <div v-if="accOffset > 0">+{{ accOffset }} ms</div> 
                        <div v-else>{{ accOffset }} ms</div> 
                    </span>
                    </Transition>
            </div>
        </div>
        <h5 class="p-2 mt-4">{{ group[4] }}</h5>
    </fieldset>
</template>

<script>
export default {
    name: 'Subtitle',
    props: {
        subtitle: Object,
        accOffset: Number,
        downloadReady: Boolean,
    },
    emits: ['before-time', 'after-time'],
}
</script>

<style scoped>
fieldset, legend {
    all: revert;
}
</style>