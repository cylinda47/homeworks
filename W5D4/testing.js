// const readline = require('readline');
//
// const reader = readline.createInterface({
//   input: process.stdin,
//   output: process.stdout
// });
//
// function addTwoNumbers(callback) {
//   // Notice how nowhere do I return anything here! You never return in
//   // async code. Since the caller will not wait for the result, you
//   // can't return anything to them.
//
//   reader.question("Enter #1: ", function (numString1) {
//     reader.question("Enter #2: ", function (numString2) {
//       const num1 = parseInt(numString1);
//       const num2 = parseInt(numString2);
//
//       callback(num1 + num2);
//     });
//   });
// }
//
// addTwoNumbers(function (result) {
//   console.log(`The result is: ${result}`);
//   reader.close();
// });

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function absurdTimesAsync (numTimes, fnAsync, completionFn) {
  let i = 0;

  function loopStep () {
    if (i == numTimes) {
      // we're done, stop looping
      completionFn();
      return;
    }

    i++;

    // fnAsync is an asynchronous function that takes a callback (in this case loopStep)
    fnAsync(loopStep);
  }

  loopStep();
}

function addTwoNumbersAsync(callback) {
  reader.question("Enter #1: ", function (numString1) {
    reader.question("Enter #2: ", function (numString2) {
      const num1 = parseInt(numString1);
      const num2 = parseInt(numString2);

      callback(num1 + num2);
    });
  });
}

let totalSum = 0;

function addTwoNumbersAndIncrementAsync(callback) {
  addTwoNumbersAsync(function (result) {
    totalSum += result;

    console.log(`Sum: ${result}`);
    console.log(`Total Sum: ${totalSum}`);

    callback();
  });
}

function outputResultAndCloseReader () {
  console.log(`All done! Total Sum: ${totalSum}`);
  reader.close();
}

absurdTimesAsync(3, addTwoNumbersAndIncrementAsync, outputResultAndCloseReader);
