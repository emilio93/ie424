// Copyright 2018 Emilio Rojas
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

const fs = require('fs');
const readline = require('readline');

// Use:
// node ./translate.js mycode.asm

// Gets input filename from the command
let getInputFile = (args, v=false) => {
  // Exit if no input file is provided
  if (typeof args[2] === 'undefined') {
    console.log('input file required');
    process.exit();
  }
  let asmFilename = args[2];
  // Print info if v=true
  if (v) console.log(`${asmFilename} set as input file`);
  return asmFilename;
};

// Gets output filename from the command
// Defaults to input filename with .v extension
let getOutputFile = (args, v=false) => {
  let vlFilename = args[3];
  if (typeof args[3] === 'undefined') {
    if (v) console.log('no output file specified');
    vlFilename = getInputFile(args).replace('.asm','.v');
  }

  if (v) console.log(`${vlFilename} set as output file`);
  return vlFilename;
};

// Creates the verilog module code.
//
let generateModule = (lines,dataWidth=16,instructionWidth=36,includeFile="Defintions.v", moduleName="ROM", iAddress="iAddress", oInstruction="oInstruction") => {
  let tags = '';
  let instructions = '';

  lines.forEach((val, idx, arr) => {
    if (val.type==='tag')
      tags = `${tags}\`define ${val.tag} 10'd${val.tagIp}\n`;
  });

  lines.forEach((val, idx, arr) => {
    if (val.type==='tag') {
      instructions = `${instructions}// ${val.tag}:\n`;
    }
    else if (val.type==='op') {
      let currLine=[];
      val.opParams.forEach((val,idx,arr) => {
        if (idx===0||!val[0].match(/[A-Z]/i)) {
          currLine.push(val);
        }
        else {
          currLine.push(`\`${val}`)
        }
      });
      instructions = `${instructions}  ${val.opIp}: ${oInstruction} = {\`${currLine.join(',')}};\n`;
    }
  });

return `\`timescale 1ns / 1ps
\`include "${includeFile}"

${tags}
module ${moduleName}
(
  input  wire[${dataWidth-1}:0] ${iAddress},
  output reg [${instructionWidth-1}:0] ${oInstruction}
);
always @ (${iAddress})
begin
  case (${iAddress})
${instructions}
  default:
    ${oInstruction} = {\`LED,24'b10101010}; // NOP
  endcase
end

endmodule
`;
}

// array
// 0 : process path (node)
// 1 : script name (translate.js)
// 2 : asm file (mycode.js)
let arguments = process.argv;

let asmFilename = getInputFile(arguments);

let vlFilename = getOutputFile(arguments);

// output lines of code represented as
// {
//   type     : 'tag' | 'op', // tags or operations are supported
//
//   // Required if type is tag
//   tag      : String,        // name of the loop, first char must be alfabetic,
//                             // tags can have alfanumeric chars and underscore(_).
//   tagIp    : int,           // instruction number to which the tag points to.
//
//   opType   : 2 | 3 | 4,    // depends on quantity of strings separated by a comma (,)
//   opParams : [],           // Instruction_id, param_0, [[param_1], param_2] //[comments]
let output = [];


// Regexp's give information about a given line
let regexpTag = /\s*([A-Z]+[A-Z0-9_]+)\s*:\s*/gi;
let regexpOp1 = /^\s*([A-Z0-9]+)\s*,\s*([A-Z0-9'_]+)\s*$/img;
let regexpOp2 = /^\s*([A-Z0-9]+)\s*,\s*([A-Z0-9'_]+)\s*,\s*([A-Z0-9'_]+)\s*(|\/\/.*)*$/gmi;
let regexpOp3 = /^\s*([A-Z0-9]+)\s*,\s*([A-Z0-9'_]+)\s*,\s*([A-Z0-9'_]+)\s*,\s*([A-Z0-9'_]+)\s*(|\/\/.*)*$/gmi;

// Line reader to read the asm file
let asmStream = fs.createReadStream(asmFilename);
let lineReader = readline.createInterface({
  input: asmStream
});

i=0;
ip=0;
lineReader.on('line', function (line) {
  i++;
  if(line.match(regexpTag)) {
    let match = regexpTag.exec(line);
    output.push({
      'type':'tag',
      'tag':match[1],
      'tagIp':ip,
      'opType': '',
      'opParams': '',
      'opIp': ''
    });
  }

  else if (line.match(regexpOp1)) {
    let match = regexpOp1.exec(line);
    output.push({
      'type':'op',
      'tag':'',
      'tagIp':'',
      'opType': 1,
      'opParams': [match[1],match[2]],
      'opIp': ip++
    });
  }

  else if (line.match(regexpOp2)) {
    let match = regexpOp2.exec(line);
    output.push({
      'type':'op',
      'tag':'',
      'tagIp':'',
      'opType':2,
      'opParams':[match[1],match[2],match[3]],
      'opIp': ip++
    });
  }

  else if (line.match(regexpOp3)) {
    let match = regexpOp3.exec(line);
    output.push({
      'type':'op',
      'tag':'',
      'tagIp':'',
      'opType':3,
      'opParams':[match[1],match[2],match[3],match[4]],
      'opIp': ip++
    });
  }

  else console.log(`${i}: IGNORED LINE\t${line}`);
});

// Write verilog file when done reading
lineReader.on('close', () => {
  fs.writeFile(vlFilename, generateModule(output), function(err) {
    if(err) {
      return console.log(err);
    }
    console.log(`File ${vlFilename} was written.`);
    console.log(generateModule(output));
  });
});
