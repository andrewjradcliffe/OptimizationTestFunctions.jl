# Need to decide size
# For fixed size, a = 3.6, b = 4.2, c = 2.6, m = 5
function langermann_fixed(x)
    s = zero(eltype(x))
    ₋π⁻¹ = -1 / π
    for i ∈ 1:5
        z = zero(eltype(x))
        for j ∈ eachindex(x)
            z += (x[j] - 3.6)^2
        end
        s += 2.6 * exp(₋π⁻¹ * z) * cos(π * z)
    end
    s
end

# fixed size, using arrays
const __a = Float64[3, 5, 2, 1, 7]
const __b = Float64[5, 2, 1, 4, 9]
const __c = Float64[1, 2, 5, 2, 3]

function langermann5(x)
    s = zero(eltype(x))
    ₋π⁻¹ = -1 / π
    for i ∈ 1:5
        z = zero(eltype(x))
        aᵢ = __a[i]
        for j ∈ eachindex(x)
            z += (x[j] - aᵢ)^2
        end
        s += __c[i] * exp(₋π⁻¹ * z) * cos(π * z)
    end
    s
end
