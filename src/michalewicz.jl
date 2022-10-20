#
# Date created: 2022-10-18
# Author: aradclif
#
#
############################################################################################
# m = 10
# function michalewicz(x)
#     s = zero(eltype(x))
#     for i ∈ eachindex(x)
#         s += sin(x[i]) * (sin(i * x[i]^2 / π))^20
#     end
#     -s
# end

# # manually unrolling the power is considerably faster
# function michalewicz2(x)
#     s = zero(eltype(x))
#     for i ∈ eachindex(x)
#         v¹ = sin(i * x[i]^2 / π)
#         v² = v¹^2
#         v⁴ = v²^2
#         v⁸ = v⁴^2
#         v¹⁶ = v⁸^2
#         v²⁰ = v¹⁶ * v⁴
#         s += sin(x[i]) * v²⁰
#     end
#     -s
# end

# fastest
function michalewicz(x)
    s = zero(eltype(x))
    π⁻¹ = 1 / π
    for i ∈ eachindex(x)
        v = sin(i * x[i]^2 * π⁻¹)
        v² = v^2
        v⁴ = v²^2
        v⁸ = v⁴^2
        v¹⁶ = v⁸^2
        v²⁰ = v¹⁶ * v⁴
        s += sin(x[i]) * v²⁰
    end
    -s
end

# # essentially equivalent
# function michalewicz2(x)
#     s = zero(eltype(x))
#     π⁻¹ = 1 / π
#     for i ∈ eachindex(x)
#         v = sin(i * x[i]^2 * π⁻¹)
#         v² = v * v
#         v⁴ = v² * v²
#         v⁸ = v⁴ * v⁴
#         v¹⁶ = v⁸ * v⁸
#         v²⁰ = v¹⁶ * v⁴
#         s += sin(x[i]) * v²⁰
#     end
#     -s
# end
