# Deutsch-Jozsa Algorithm

> **Category**: search &nbsp;|&nbsp; **Difficulty**: beginner &nbsp;|&nbsp; **Qubits**: 4 &nbsp;|&nbsp; **Gates**: 9 &nbsp;|&nbsp; **Depth**: 5

The Deutsch-Jozsa algorithm decides, with certainty and a single oracle query, whether a function f:{0,1}^n → {0,1} is constant (same output for all inputs) or balanced (outputs 0 for exactly half the inputs). Classically, this requires 2^(n-1)+1 queries in the worst case. The circuit uses a phase-kickback oracle and measures: all-zeros → constant, any-one → balanced.

## Expected Output

|111⟩ (balanced function) — at least one c[i]=1

## Circuit

The OpenQASM 2.0 circuit is in [`circuit.qasm`](./circuit.qasm).

```
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
```

## Tags

`deutsch-jozsa` `oracle` `exponential-speedup` `query-complexity`

## References

- [Deutsch & Jozsa (1992). Rapid Solution of Problems by Quantum Computation. Proc. R. Soc. A 439](https://doi.org/10.1098/rspa.1992.0167)

## License

MIT — part of the [OpenQC Algorithm Catalog](https://github.com/openqc-algorithms).
