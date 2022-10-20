<template>
  <metainfo>
    <template v-slot:title="{ content }">{{ content ? `${content} | Subtitle Sync` : `Subtitle Sync` }}</template>
  </metainfo>
  <div class="border rounded border-primary container">
    <Header title="Subtitle Sync"/>
    <router-view></router-view>
    <Footer title="subtitle-sync"/>
  </div>
</template>

<script>
import { h } from '@vue/runtime-core'
import Header from './components/Header.vue'
import Footer from './components/Footer.vue'
import { useMeta } from 'vue-meta'

export default {
  setup() {
    useMeta({
      title: 'Time sync tool',
      htmlAttrs: { lang: 'en', amp: true },
      link: {rel: 'canonical', href: 'https://www.subtitle-sync.com'},
      meta: [
        { name: 'description', vmid: 'description', content: 'Online edit your subtitle offset by choosing a timestamp and the tool will automatically sync all lines' },
        { name: 'keywords', content: 'sync, resync, synchronize, sub, subtitle, tool, editor, edit, time, timestamp, auto, automatically, online, offset, shift, shifter, str, free, fix, adjust, suprep, vue, pegjs, parser, generator'},
      ],
    })
  },
  name: 'App',
  components: {
    Header,
    Footer,
  },
}
</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400&display=swap');
* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}
body {
  font-family: 'Poppins', sans-serif;
}
.container {
  max-width: 500px;
  margin: 30px auto;
  overflow: auto;
  min-height: 300px;
  border: 1px solid steelblue;
  padding: 30px;
  padding-right: 110px;
  padding-left: 30px;
  border-radius: 5px;
  overflow-x: hidden;
}
.inner-container {
  max-width: 500px;
  margin: 30px auto;
  overflow: auto;
  min-height: 300px;
  border: 1px solid steelblue;
  padding: 30px;
  border-radius: 5px;
  opacity: 0.5;
  transition: opacity 1s;
}
.btn {
  display: inline-block;
  background: #000;
  color: #fff;
  border: none;
  padding: 10px 25px;
  margin: 5px;
  border-radius: 5px;
  cursor: pointer;
  text-decoration: none;
  font-size: 15px;
  font-family: inherit;
  white-space: nowrap;
  text-align: center;
}
.btn:focus {
  outline: none;
}
.btn:active {
  transform: scale(0.98);
}
.btn-block {
  display: block;
  width: 100%;
}
input[type="file"] {
    display: none;
}
.fade-in {
    transition: opacity 2s !important;
}
.v-enter-active,
.v-leave-active {
  transition: opacity 0.3s ease;
}
.v-enter-from,
.v-leave-to {
  opacity: 0;
}
.list-group {
	list-style: decimal inside;
}
#bullet-List{
  list-style: none !important;
}
.list-group-item {
	display: list-item;
}
.float-right-top {
  position: relative;
  left: 103%;
  top: -120px;
} 
</style>