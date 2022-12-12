# OptimizationTestFunctions

## Installation
```julia
using Pkg
Pkg.add("OptimizationTestFunctions")
```

## Description

This package provides pure-Julia implementations of the test functions enumerated in the references. Functions which were originally intended for only two arguments have been generalized to arbitrary dimensions using a similar approach to that applied to, for example, the Rosenbrock function. Note, however, the generalized form of a what was initially a two dimensional problem may not have readily identifiable global minima.

The implementations of the functions themselves are not naive translations, but are written so as to re-use as much computation as possible. This can lead to significant speed-ups, thus, if benchmarks differ between this library and your other favorite library, have a look at the code. 

Notably, by virtue of being written in pure Julia, these functions should work with most automatic differentiation frameworks which operation on Julia code. Specifically, the functions in this library have been tested against `ForwardDiff`, `ReverseDiff`, `Enzyme` and `Zygote`.

## Usage and Notes

There is an implicit assumption that the single argument passed to a given function conforms to the `AbstractArray` interface. Furthermore, the array should support linear indexing, and the native indexing style should be `IndexLinear` Though, some functions may tolerate `IndexCartesian`, no guarantees are provided as to correctness.

It is also worthwhile to note the behavior of the functions with respect to element type: all computations are performed in the nearest element type which supports the elementary functions invoked within the test function body. For example, if the argument is an array with eltype `Float32`, all computations (including a potentially large sum) will occur in `Float32` -- i.e., no intermediate promotions will be made to `Float64` and the result cast back at the end.

An example
```julia
julia> using OptimizationTestFunctions

julia> griewank([1.0,2.0,3.0])
1.0170279701835736
```

## Future work
Implement rest of functions from Jamil et al.

## References
- Molga, Marcin, and Czesław Smutnicki. "Test functions for optimization needs." Test functions for optimization needs 101 (2005): 48.
- Jamil, Momin, and Xin-She Yang. "A literature survey of benchmark functions for global optimization problems." arXiv preprint arXiv:1308.4008 (2013).
