function sphere(x)
    s = zero(eltype(x))
    for i ∈ eachindex(x)
        s += x[i]^2
    end
    s
end

function axis_parallel_hyperellipsoid(x)
    s = zero(eltype(x))
    for i ∈ eachindex(x)
        s += i * x[i]^2
    end
    s
end

# function rotated_hyperellipsoid(x)
#     s = zero(eltype(x))
#     for i ∈ eachindex(x)
#         @inbounds for j ∈ 1:i
#             s += x[j]^2
#         end
#     end
#     s
# end

# Significantly faster with @simd in the primal, but little change to AD
# function rotated_hyperellipsoid2(x)
#     s = zero(eltype(x))
#     for i ∈ eachindex(x)
#         @inbounds @simd for j ∈ 1:i
#             s += x[j]^2
#         end
#     end
#     s
# end

# The cure: recognize it for what it is and act accordingly, i.e. convert
# an 𝒪(n²) problem into 𝒪(n). Approximately 3 order of magnitude speedup.
function rotated_hyperellipsoid(x)
    s = zero(eltype(x))
    j = length(x)
    for i ∈ 1:length(x)
        s += j * x[i]^2
        j -= 1
    end
    s
end
