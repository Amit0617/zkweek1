pragma circom 2.0.0;

include "../../node_modules/circomlib/circuits/comparators.circom";

template RangeProof(n) {
    assert(n <= 252);
    signal input in; // this is the number to be proved inside the range
    signal input range[2]; // the two elements should be the range, i.e. [lower bound, upper bound]
    signal output out;

    component low = LessEqThan(n);
    component high = GreaterEqThan(n);

    // [assignment] insert your code here
   
    low.in[0] <== in;
    high.in[0] <== in;

    //less than upper bound
    low.in[1] <== range[1];

    //greater than lower bound
    high.in[1] <== range[0];

    //To verify both lie within range ouput should be 1 when only output of both are 1(or true)
    //If any of them is false then it should be false or 0.
    out <== low.out * high.out;
}