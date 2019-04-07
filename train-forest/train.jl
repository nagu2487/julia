using DataFrames
using DecisionTree
using JLD
using Random

# Read the iris data set.
df = readtable(ARGS[1], header = false)

# Get the features and labels.
features = convert(Array, df[:, 1:4])
features = float.(features)


labels = convert(Array, df[:, 5])
labels = string.(labels)

# Train decision tree classifier.
model = RandomForestClassifier(n_trees=3, partial_sampling=0.7)
DecisionTree.fit!(model, features, labels)

# Save the model.
save(ARGS[2], "model", model)

