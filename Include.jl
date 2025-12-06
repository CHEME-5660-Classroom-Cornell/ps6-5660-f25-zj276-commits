# setup paths -
const _ROOT = @__DIR__;
const _PATH_TO_SRC = joinpath(_ROOT, "src");
const _PATH_TO_DATA = joinpath(_ROOT, "data");
const _PATH_TO_FIGS = joinpath(_ROOT, "figs");
const _PATH_TO_SIMS = joinpath(_ROOT, "sims");

# make sure all is up to date -
using Pkg

# Activate the project environment
Pkg.activate(".")

# Install standard packages if needed
_pkgs = ["DataFrames", "Statistics", "StatsBase", "Plots", "Colors", "PrettyTables", 
         "CSV", "Distributions", "FileIO", "JLD2", "HypothesisTests", "StatsPlots", 
         "LinearAlgebra", "ProgressMeter", "Test"]

for pkg in _pkgs
    try
        Pkg.add(pkg)
    catch
        println("Warning: Could not add $pkg")
    end
end

# Try to add the custom VL package (non-critical if it fails)
try
    Pkg.add(url="https://github.com/varnerlab/VLQuantitativeFinancePackage.jl.git")
catch e
    println("Warning: Could not add VLQuantitativeFinancePackage: $e")
end

# load external packages -
using VLQuantitativeFinancePackage
using DataFrames
using Statistics
using StatsBase
using Plots
using Colors
using PrettyTables
using CSV
using Distributions
using FileIO
using JLD2
using HypothesisTests
using StatsPlots
using LinearAlgebra
using ProgressMeter
using Test