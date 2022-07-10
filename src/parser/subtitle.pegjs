{ 
	let result;
    const removeNull = (sen) => sen.toString().replace(/\n/g, '\n');
    
	function concat(str) {
    	let i = 0;
    	let result = "";
        Array.from(str).forEach(e => result += e);
        return result;
    }
    
    function removeComma(str) {
        const comma = ',';
        let result = "";
        for (let i = 0; i < str.length; i++) {
            if (str[i] === comma && str[i+1] === comma && str[i+2] !== comma) {
                result += comma;
            } else if (str[i] === comma) {
                result += '';
            } else {
                result += str[i];
            }
        }
        return result;
    }
}

Start
	= Seqsub*
    / '\0';

Seqsub
	= num:Num+ NewLine start:Time arrow:' --> ' end:Time NewLine sen:Sentence '\r\n\r\n' ('\r')?
		{let senStr = concat(result); return [concat(num), concat(start), arrow, concat(end), removeComma(senStr)]};
Time
	= Num Num ':' Num Num ':' Num Num ',' Num Num Num;

Num
	= [0-9];

Sentence
	= sen:(char+ ('\r\n'char+)?)
    	{result = removeNull(sen)};

char
	= [a-zA-Z0-9!@#$&()\-`.+,/\"' '<>=:?ñ]+;
    
NewLine 
	= [ \t\n\r]*
    / [\r]*;

Next
    = '\r\n\r\n\r';