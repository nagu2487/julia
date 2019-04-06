using DataFrames
using DecisionTree
using JLD

# Read the iris data set.
df = readtable(ARGS[1], header = false)

# Get the features and labels.
features = convert(Array, df[:, 1:4])
features = float.(features)

labels = convert(Array, df[:, 5])
labels = string.(labels)

# Train decision tree classifier.
model = DecisionTreeClassifier(pruning_purity_threshold=0.9)
DecisionTree.fit!(model, features, labels)

# Save the model.
save(ARGS[2], "model", model)

