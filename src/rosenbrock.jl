# function rosenbrock(x)
#     a = one(eltype(x))
#     b = 100 * a
#     s = zero(eltype(x))
#     for i ∈ 1:length(x)-1
#         s += (a - x[i])^2 + b * (x[i+1] - x[i]^2)^2
#     end
#     s
# end

function rosenbrock(x)
    a = one(eltype(x))
    b = 100 * a
    s = zero(eltype(x))
    @inbounds for i ∈ firstindex(x):lastindex(x)-1
        s += (a - x[i])^2 + b * (x[i+1] - x[i]^2)^2
    end
    s
end
