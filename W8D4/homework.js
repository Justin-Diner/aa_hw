// Phase I - Callbacks

const titleize = (nameArr, callback) => {

	newArr = nameArr.map(ele => {
		return `Mx. ${ele} Jingleheimer Schmidt`
	});

	return callback(newArr)
}

const printCallback = arr => {
	arr.forEach(ele => {
		console.log(ele);
	})
}
console.log(titleize(["Mary", "Brian", "Leo"], printCallback));

// Phase II: Constructors, Prototypes, and this

function Elephant(name, height, tricks) {
	this.name = name 
	this.height = height
	this.tricks = tricks
}

Elephant.prototype.trumpet = function() {
	console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRRRRR!!!!!!!!!!!!'`);
}

Elephant.prototype.grow = function() {
	this.height += 12;
}

Elephant.prototype.addTrick = function(trick) {
	this.tricks.push(trick);
}

Elephant.prototype.play = function() {
	numtrick = Math.floor(Math.random() * this.tricks.length)
	console.log(`${this.name} is ${this.tricks[numtrick]}ing`)
}

let dumbo = new Elephant("Dumbo", 160, ["sit", "laugh", "eat"])

dumbo.trumpet();
dumbo.grow();
console.log(dumbo.height);
dumbo.addTrick("heel");
console.log(dumbo.tricks)
dumbo.play()

// Phase III: Function Invocation

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

Elephant.prototype.paradeHelper = function(elephant) {
	console.log(`${elephant.name} is trotting by!`);
}

herd.forEach(ele => {
	console.log(ele.paradeHelper(ele));
})

// Phase IV: Closures
function dinerBreakfast(order) {
  let order = "I'd like cheesy scrambled eggs please.";
  console.log(order);

  return function (food) {
    order = `${order.slice(0, order.length - 8)} and ${food} please.`;
    console.log(order);
  };
}

let bfastOrder = dinerBreakfast();
bfastOrder("chocolate chip pancakes");
bfastOrder("grits");
