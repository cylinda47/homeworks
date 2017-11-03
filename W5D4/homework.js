// Simple Timeout //

window.setTimeout(function(){
  alert(`HAMMERTIME`);
}, 5000);

// Timeout Plus Closure //

function hammerTime(time){
  setTimeout(function () {
    alert(`${time} is hammertime!`);
  }, time);
}

Some tea? Some biscuits? //

const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function askTeaOptions(callback){
  //ask first question
  reader.question(`Would you like some tea? (y/n)`, function(teaAns) {
    //ask second question
    reader.question(`Would you like some biscuits? (y/n)`, function(biscuitAns) {
      //render Reponse func => giveTeaResponsefunction(teaOpt, bisOpt)
      callback(teaAns, biscuitAns);
    });
  });
}

const giveTeaResponsefunction = function (teaOpt, bisOpt){
  const firstAns = (teaOpt === 'y') ? 'do' : 'don\'t';
  const secondAns = (bisOpt === 'y') ? 'do' : 'don\'t';
  console.log(`So you ${firstAns} want tea and you ${secondAns} want biscuits.`);
  reader.close();
};

askTeaOptions(giveTeaResponsefunction);

function Cat () {
  this.name = 'Markov';
  this.age = 3;
}

function Dog () {
  this.name = 'Noodles';
  this.age = 4;
}

Dog.prototype.chase = function (cat) {
  console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`)
};

const Markov = new Cat ();
const Noodles = new Dog ();

console.log(Noodles.chase.apply(Markov, [Noodles]));
