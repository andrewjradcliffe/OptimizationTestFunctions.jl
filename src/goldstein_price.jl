# Something is not quite right?
function goldstein_price(x)
    s = zero(eltype(x))
    for i ∈ 1:length(x)-1
        v = x[i] + x[i+1] + 1
        w = 19 - 14x[i] + 3x[i]^2 - 14x[i+1] + 6x[i] * x[i+1] + 3x[i+1]^2
        s += v * v * w
    end
    1 + s
end

function goldstein_price2(x)
    s = zero(eltype(x))
    for i ∈ 1:length(x)-1
        v = 2x[i] - 3x[i+1]
        w = 18 - 32x[i] + 12x[i]^2 + 48x[i+1] - 36x[i] * x[i+1] + 27x[i+1]^2
        s += v * v * w
    end
    30 + s
end

