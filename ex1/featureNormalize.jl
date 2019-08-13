module FeatureUtils

using Statistics
using DataFrames

"""

   normalize(x)

Normalizes the given array `x`, returns `x` normalized,
its mean *mu* and its standard deviation *sigma*.

- `x::Array{Float64}`: the array with values to be normalized
"""
function normalize(x)
    mu = mean(x)
    sigma = std(x)
    return (x .- mu) / sigma, mu, sigma
end;

"""

    featureNormalize(X)

Normalizes all features from the given DataFrame.
"""
function featureNormalize(X)
    Xnorm = Array{Float64, 2}(undef, size(X, 1), 2)
    mu = Array{Float64}(undef, 0)
    sigma = Array{Float64}(undef, 0)
    for column in 1:size(X, 2) 
        x, m, s = normalize(X[:, column]);
        Xnorm[:, column] = x
        append!(mu, m)
        append!(sigma, s)
    end
    Xnorm, mu, sigma
end

export featureNormalize

end