metadata_packages = [
    "DataFrames",
    "DecisionTree",
    "HDF5",
    "JLD",
    "BSON"]

using Pkg

for package=metadata_packages
    Pkg.add(package)
end

Pkg.resolve()
