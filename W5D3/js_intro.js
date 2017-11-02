function madLib(verb, adj, noun) {
  return `We shall ${verb} the ${adj} ${noun}.`;
};

function isSubstring(searchString, subString) {
  if (searchString.indexOf(subString) >= 0) {
    return true;
  } else {
    return false;
  }
};

function fizzBuzz(array) {
  var newArr = [];
  for(var i=0; i<array.length; i++){
    if ((array[i] % 3 === 0 ) || (array[i] % 5 === 0)) {
      if (!(array[i] % 15 === 0)) {
        newArr.push(array[i]);
      }
    }
  }
  return newArr;
};

function isPrime(num) {
  var factors = [];

  if (num == 1) {
    return false;
  }

  for(var i=1; i<=num; i++) {
    if (num % i === 0) {
      factors.push(i)
    }
  }

  if (factors.length <= 2) {
    return true;
  } else {
    return false;
  }
};

function sumOfNPrimes(n) {
  var primes = [];
  for(var i=0;primes.length<=n;i++){
    if (isPrime(i)) {
      primes.push(i)
    }
  }
  sum = eval(primes.join("+"));
  return sum;
};

function titleize(arr, printCallback) {
  arr.forEach(printCallback)
}

function printCallback(name) {
  console.log(`Mx. ${name} Jingleheimer Schmidt`);
}

function Elephant(name, height, tricks){
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function() {
  console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`)
}

Elephant.prototype.grow = function(trick) {
  this.tricks.push(trick);
}

Elephant.prototype.addTrick = function() {
  this.height += 12;
}

Elephant.prototype.play = function() {
  var i = Math.floor((Math.random() * this.tricks.length))
  console.log(this.tricks.length);
  console.log(`${this.name} is ${this.tricks[i]}!`)
}

Elephant.paradeHelper = function(elephant) {
  console.log(`${elephant.name} is trotting by!`);
}

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

herd.forEach(Elephant.paradeHelper);

function dinerBreakfast() {
  let order = "I'd like cheesy scrambled eggs please.";
  console.log(order);

  return function (food) {
    order = `${order.slice(0, order.length - 8)} and ${food} please.`;
    console.log(order);
  };
};
