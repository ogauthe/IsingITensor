#!usr/bin/env julia
push!(LOAD_PATH, joinpath(@__DIR__, "..", "src"))

using IsingITensor
using LinearAlgebra
using ITensors

######## Paramètres ###########

N = 20 #attention prendre N pair
s = 1 / 2
type = ["up"]
D = 10
Dmax = 10
J = 1
h = 0.5
dt = 1e-5
dim = 2
beta = 1

shl = Index(dim, "horiz left")
shr = Index(dim, "horiz right")
svd = Index(dim, "vert down")
svu = Index(dim, "vert up")

####### Test ###########

randomps = initnewrandomhalfspin(N, Dmax)
mps = initnewmpshalfspin(N, D)
tensor = isinggates(randomps, beta, shl => shr, svd => svu, J)

@show tensor