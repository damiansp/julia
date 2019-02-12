using LibBSON
using JSON
using Mongo # not currently supported for Julia 1.0


# Storage
client = MongoClient()
storage = MongoCollection(client, "db", "dataframes")
data_dict = JSON.parse(JSON.json(test_data))
data_dict["id"] = "iris_test_data"
insert(storage, data_dict)

# Retrieval
# Returns BSON obj
data_from_mongo = first(find(storage, query("id" => "iris_test_data"))) 
df_from_mongo = DataFrame()
for i in 1:length(data_from_mongo["columns"])
  df_from_nongo[Symbol(data_from_mongo["colindex"]["names"][i])] = Array(
    data_from_mongo["columns"][i])
end

