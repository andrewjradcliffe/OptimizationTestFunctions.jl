function sumofpowers(x)
    s = zero(eltype(x))
    @inbounds for i ∈ eachindex(x)
        s += abs(x[i])^(i+1)
    end
    s
end
