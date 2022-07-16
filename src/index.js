var parser = require('./subtitle-parser.js');

var fs = require('fs');

let sub = String.empty;
try {
    sub = fs.readFileSync('./str/The.Place.Beyond.the.Pines.2013.US.Bluray.1080p.DTS-HD.x264-Grym@BTNET.srt', 'utf8');
    sub = sub.trim();
    sub += "\r\n\r\n";
} catch (err) {
    console.error(err);
}

let Subtitle = parser.parse(sub);
console.log(Subtitle);

let num = Subtitle[7][0];
let startTime = Subtitle[7][1];
let arrow = Subtitle[7][2];
let endTime = Subtitle[7][3];
let text = Subtitle[7][4];

console.log(num);
console.log(startTime);
console.log(arrow);
console.log(endTime);
console.log(text);