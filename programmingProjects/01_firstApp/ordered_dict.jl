using Dates
using OrderedCollections

println(OrderedDict(x => Dates.monthname(x) for x = (1:12)))
