// Phase I - JS Fundamentals
// madLib
function madLib(verb, adjective, noun) {
	return "We shall " + verb + " the " + adjective + " " + noun +"."
}

function madLib2(verb, adjective, noun) {
	return `We shall ${verb} the ${adjective} ${noun}.`
}

console.log(madLib('make', 'best', 'guac'))
console.log(madLib2('make', 'best', 'guac'))

// isSubstring
let isSubstring = (sentence, word) => {
	if (sentence.includes(word)) {
		return true 
	}
	return false 
}

console.log(isSubstring("time to program", "time"));

function fizzBuzz(array) {
	let answer = []

	for (let i =0; i < array.length; i++){
		if ((array[i] % 3 === 0) ^ (array[i] % 5 === 0)) {
			answer.push(array[i])
		}
	}
	return answer 
}

console.log(fizzBuzz([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]))

function isPrime(number) {
	if (number < 2) {
		return false 
	}

	for (let i = 2; i < number; i++) {
		if (number % i === 0) {
			return false 
		}
	}
	return true 
}

console.log(isPrime(12))
console.log(isPrime(11))

function sumOfNPrimes(n) {
	let sum = 0 
	let primes = []

	let i = 2
	while (i < n) {
		if (isPrime(i)) {
			primes.push(i)
			i++
		}
	}

	for (let i = 0; i < primes.length; i++) {
		sum += primes[i]
	}
	return sum 
}

console.log(sumOfNPrimes(4))