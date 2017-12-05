let number = '16633'; // your number goes here
let result = 0;

for (let i = 0, len = number.length; i < len; i++) {
    let numberToAdd;
    let nextNumber;

    if (i === number.length-1) {
        nextNumber = number.charAt(0);
    } else {
        nextNumber = number.charAt(i+1)
    }

    if (number.charAt(i) === nextNumber) {
        numberToAdd = number.charAt(i);
    }

    result += parseInt(numberToAdd);
}

console.log(result);
