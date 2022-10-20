#
# Date created: 2022-10-18
# Author: aradclif
#
#
############################################################################################
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

function rotated_hyperellipsoid(x)
    s = zero(eltype(x))
    for i ∈ eachindex(x)
        for j ∈ 1:i
            s += x[j]^2
        end
    end
    s
end
