OPENQASM 2.0;
include "qelib1.inc";
// Deutsch-Jozsa: 3-bit balanced oracle f(x0,x1,x2) = x0 XOR x1 XOR x2
// q[0..2]: input register, a[0]: ancilla output qubit
qreg q[3];
qreg a[1];
creg c[3];
// Prepare ancilla in |-> for phase kickback
x a[0];
h a[0];
// Superpose input register
h q[0]; h q[1]; h q[2];
// Balanced oracle: f = x0 XOR x1 XOR x2  (CX each input bit to ancilla)
cx q[0],a[0];
cx q[1],a[0];
cx q[2],a[0];
// Hadamard on input to extract oracle type
h q[0]; h q[1]; h q[2];
// Measure: all-zero → constant; any-one → balanced (output: |111>)
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
