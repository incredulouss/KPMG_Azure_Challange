
let object = {"x1":{"y1":{"z1":"a1"}}};

let keys = ['x1', 'y1', 'z1'];

let value = keys.reduce(
    (accumulator,currentvalue) => accumulator[currentvalue],object
    );

console.log(value); 