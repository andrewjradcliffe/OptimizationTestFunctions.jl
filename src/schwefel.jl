# function schwefel(x)
#     s = zero(eltype(x))
#     for i ∈ eachindex(x)
#         s += -x[i] * sin(√(abs(x[i])))
#     end
#     s
# end
# function schwefel2(x)
#     s = zero(eltype(x))
#     for i ∈ eachindex(x)
#         s -= x[i] * sin(√(abs(x[i])))
#     end
#     s
# end

# function schwefel3(x)
#     s = zero(eltype(x))
#     for i ∈ eachindex(x)
#         xᵢ = x[i]
#         s -= xᵢ * sin(√(abs(xᵢ)))
#     end
#     s
# end

# Move the `-` outside and reduce by 33%
function schwefel(x)
    s = zero(eltype(x))
    for i ∈ eachindex(x)
        s += x[i] * sin(√(abs(x[i])))
    end
    -s
end
