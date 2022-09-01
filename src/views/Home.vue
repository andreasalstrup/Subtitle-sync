<template>
    <p>Sync subtitle by changing the start time or end time. The offset will then be applied throughout.</p>
    <ul class="list-group p-2" id="bullet-List">
      <li class="list-group-item list-group-item-primary"><i class="fa-solid fa-language"></i> Sync all languages</li>
      <li class="list-group-item list-group-item-primary"><i class="fa-solid fa-closed-captioning"></i> Supports SubRip file format (.str)</li>
    </ul>  
      <ol class="list-group p-2">
        <li class="list-group-item list-group-item-success">Find (Ctrl + F) line you want to match with a timestamp</li>
        <li class="list-group-item list-group-item-success">Apply offset automatically to the whole subtitle</li>
        <li class="list-group-item list-group-item-success">Save subtitle and watch movie</li>
      </ol>
    <div class="text-end">
        <Button 
            @file-uploaded="showData" 
            childclass="btn p-2 m-2"
            type="file" 
            id="file-upload" 
            value="Choose Subtitle" 
            icon="fa-solid fa-upload"
            :color="downloadReady ? 'blue' : 'green'"/>
        <Transition>
        <div v-show="downloadReady" class="fade-in" style="position: fixed;top: 35px;display: inline-block;" >
            <Button 
                @download="downloadFile"
                childclass="btn p-2 m-2"
                type="button" 
                id="download" 
                value="Save as" 
                icon="fa-solid fa-save"
                color="Green"/>
        </div>
        </Transition>  
    </div>
    <Subtitle 
        @before-time="setBeforeTime" 
        @after-time="calculateDiff"
        :subtitle="subtitle" 
        :accOffset="accOffset" 
        :downloadReady="downloadReady"/>
</template>

<script>
import Subtitle from '../components/Subtitle.vue'
import Button from '../components/Button.vue'
import router from '@/router';

require('file-saver');

export default {
  name: 'Home',
  components: {
    Subtitle,
    Button,
  },
  data() {
    return {
      subtitle: [],
      beforeTime: new Date,
      afterTime: new Date,
      timeDiff: new Date,
      accOffset: 0,
      downloadReady: false,
      subtitleName: '',
    }
  },
  methods: {
    downloadFile(){
      let newSubtitle = this.buildSubtitle();

      let myFile = new File(
        [newSubtitle],
        "[subtitle-sync.com] " + this.subtitleName,
        {type: "text/plain;charset=utf8"}
      );

      saveAs(myFile);
    },
    buildSubtitle() {
      let subtitle = '';
      for (let e in this.subtitle) {
        let num = this.subtitle[e][0];
        let startTime = this.subtitle[e][1];
        let arrow = this.subtitle[e][2];
        let endTime = this.subtitle[e][3];
        let text = this.subtitle[e][4];

        subtitle += `${num}\n${startTime}${arrow}${endTime}\n${text}\n\n`;
      }
      return subtitle.trim();

    },
    showData() {
      const parser = require('../parser/subtitle-parser');
      const selectedFile = document.getElementById('file-upload').files[0];
      const languageEncoding = require("detect-file-encoding-and-language");

      this.subtitleName = selectedFile.name;
      

      languageEncoding(selectedFile).then((fileInfo) => {        
        let encoding = fileInfo.encoding;
        let fileReader = new FileReader();
        fileReader.onload = (fileLoadedEvent) => {
            let text = fileLoadedEvent.target.result;
            function readySubtitle(text) {
              let sub = text;
              sub = sub.trim();
              sub += "\r\n\r\n";
              return sub;
            }

            try {
              this.subtitle = parser.parse(readySubtitle(text));
            } catch (error) {
              this.downloadReady = false;
              alert(`Cannot parse the file: ${error.name}`);
              location.reload();
            }
        }

        fileReader.readAsText(selectedFile, encoding);
      });

      this.downloadReady = true;
    },
    setBeforeTime(value) {
      if (!/[0-9]+:[0-9]+:[0-9]+,[0-9]+/.test(value)) {
        return;
      }

      const timeArry = value.match(/[0-9]+/g);

      let hour = Number(timeArry[0]);
      let min = Number(timeArry[1]);
      let sec = Number(timeArry[2]);
      let ms = Number(timeArry[3]); 

      this.beforeTime = new Date(1970, 1, 1, hour, min, sec, ms);
    },
    calculateDiff(value) {
      if (!/[0-9]+:[0-9]+:[0-9]+,[0-9]+/.test(value)) {
        return;
      }

      const timeArry = value.match(/[0-9]+/g);

      let hour = Number(timeArry[0]);
      let min = Number(timeArry[1]);
      let sec = Number(timeArry[2]);
      let ms = Number(timeArry[3]); 

      this.afterTime = new Date(1970, 1, 1, hour, min, sec, ms);
      const dateDiff = Math.abs(this.afterTime - this.beforeTime);
      this.timeDiff = this.calculateTimestamp(dateDiff);

      this.afterTime.getTime() > this.beforeTime.getTime() 
      ? this.updateSubtitle(this.timeDiff - new Date(1970, 1, 1).getTime()) 
      : this.updateSubtitle(-this.timeDiff + new Date(1970, 1, 1).getTime()); 
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
    updateSubtitle(offset) {
      this.accOffset += offset;

      Object.keys(this.subtitle).forEach(key => {

        const startTimeArry = this.subtitle[key][1].match(/[0-9]+/g);
        let hourStart = Number(startTimeArry[0]);
        let minStart = Number(startTimeArry[1]);
        let secStart = Number(startTimeArry[2]);
        let msStart = Number(startTimeArry[3]); 
        const startDate = new Date(1970, 1, 1, hourStart, minStart, secStart, msStart);
        const newStartTime = (startDate.getTime() - new Date(1970, 1, 1).getTime()) + offset;
        const newStartDate = this.calculateTimestamp(newStartTime);

        const endTimeArry = this.subtitle[key][3].match(/[0-9]+/g);
        let hourEnd = Number(endTimeArry[0]);
        let minEnd = Number(endTimeArry[1]);
        let secEnd = Number(endTimeArry[2]);
        let msEnd = Number(endTimeArry[3]);
        const endDate = new Date(1970, 1, 1, hourEnd, minEnd, secEnd, msEnd);
        const newEndTime = (endDate.getTime() - new Date(1970, 1, 1).getTime()) + offset;
        const newEndDate = this.calculateTimestamp(newEndTime);

        //set start time
        let hh = newStartDate.getHours().toLocaleString('en-US', {minimumIntegerDigits: 2});
        let mm = newStartDate.getMinutes().toLocaleString('en-US', {minimumIntegerDigits: 2});
        let ss = newStartDate.getSeconds().toLocaleString('en-US', {minimumIntegerDigits: 2});
        let fff = newStartDate.getMilliseconds().toLocaleString('en-US', {minimumIntegerDigits: 3});
        this.subtitle[key][1] = `${hh}:${mm}:${ss},${fff}`;

        //set end time
        hh = newEndDate.getHours().toLocaleString('en-US', {minimumIntegerDigits: 2});
        mm = newEndDate.getMinutes().toLocaleString('en-US', {minimumIntegerDigits: 2});
        ss = newEndDate.getSeconds().toLocaleString('en-US', {minimumIntegerDigits: 2});
        fff = newEndDate.getMilliseconds().toLocaleString('en-US', {minimumIntegerDigits: 3});
        this.subtitle[key][3] = `${hh}:${mm}:${ss},${fff}`;      
      })
    },
  },
  created() {
    this.subtitle = [
      [
        "1",
        "00:02:16,612",
        " --> ",
        "00:02:19,376",
        "Senator, we're making\nour final approach into Coruscant."
      ],
      [
        '2',
        '00:02:19,482',
        ' --> ',
        '00:02:21,609',
        'Very good, Lieutenant.'
      ],
      [
        "3",
        "00:03:13,336",
        " --> ",
        "00:03:15,167",
        "We made it."
      ],
    ]
  }
}
</script>
