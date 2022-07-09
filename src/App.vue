<template>
  <div class="container">
    <Header title="Subtitle Sync"/>
    <Subtitle @before-time="setBeforeTime" @after-time="calculateDiff" :subtitle="subtitle"/>
  </div>
</template>

<script>
import { h } from '@vue/runtime-core'
import Header from './components/Header.vue'
import Subtitle from './components/Subtitle.vue'

export default {
  name: 'App',
  components: {
    Header,
    Subtitle,
  },
  data() {
    return {
      subtitle: [],
      beforeTime: new Date,
      afterTime: new Date,
      timeDiff: new Date,
    }
  },
  methods: {
    setBeforeTime(value) {
      const timeArry = value.match(/[0-9]+/g);
      console.log(timeArry);
      let hour = Number(timeArry[0]);
      let min = Number(timeArry[1]);
      let sec = Number(timeArry[2]);
      let ms = Number(timeArry[3]); 

      this.beforeTime = new Date(1970, 1, 1, hour, min, sec, ms);
    },
    calculateDiff(value) {
      const timeArry = value.match(/[0-9]+/g);

      let hour = Number(timeArry[0]);
      let min = Number(timeArry[1]);
      let sec = Number(timeArry[2]);
      let ms = Number(timeArry[3]); 

      this.afterTime = new Date(1970, 1, 1, hour, min, sec, ms);

      const dateDiff = Math.abs(this.afterTime - this.beforeTime);

      this.timeDiff = this.calculateTimestamp(dateDiff);

      this.updateSubtitle(this.timeDiff);
    },
    calculateTimestamp(ms) {
      const HOUR_IN_MS = 3600000;
      const MIN_IN_MS = 60000;
      const SEC_IN_MS = 1000;

      const hour = ms / HOUR_IN_MS;
      const hourRemainder = ms % HOUR_IN_MS;

      const min = hourRemainder / MIN_IN_MS;
      const minRemainder = hourRemainder % MIN_IN_MS;

      const sec = minRemainder / SEC_IN_MS;
      const mm = minRemainder % SEC_IN_MS;

      return new Date(1970, 1, 1, hour, min, sec, mm);
    },
    updateSubtitle(date) {



      Object.keys(this.subtitle).forEach(key => {

        const startTimeArry = this.subtitle[key][1].match(/[0-9]+/g);
        const endTimeArry = this.subtitle[key][3].match(/[0-9]+/g);
        
        //start time
        this.subtitle[key][1];
        //end time
        this.subtitle[key][3];

        console.log(key, this.subtitle[key][1]);
        console.log(key, this.subtitle[key][3]);
      })

    },
    dateToStringArray(date) {

    },
  },
  created() {
    this.subtitle = [
      [
        '1',
        '00:00:31,324',
        ' --> ',
        '00:00:34,577',
        '<font color="#D900D9">(MAN BREATHING HEAVILY)</font>'
      ],
      [
        '2',
        '00:00:39,958',
        ' --> ',
        '00:00:41,751',
        '<font color="#D900D9">(PEOPLE CHATTERING)</font>'
      ],
      [
        '3',
        '00:00:43,294',
        ' --> ',
        '00:00:45,296',
        '<font color="#D900D9">(FAIRGROUND MUSIC PLAYING)</font>'
      ],
    ]
  }
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
  border-radius: 5px;
}
.btn {
  display: inline-block;
  background: #000;
  color: #fff;
  border: none;
  padding: 10px 20px;
  margin: 5px;
  border-radius: 5px;
  cursor: pointer;
  text-decoration: none;
  font-size: 15px;
  font-family: inherit;
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
</style>
