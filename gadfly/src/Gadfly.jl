module Gadfly


export plot


"""
  plot(data_source::Union{AbstractMatrix, AbstractDataFrame},
       elements::ElementOrFunctionOrLayers...; mapping...) -> Plot
Create a new plot by specifying a `data_source`, zero or more `elements`
([Scales](@ref lib_scale), [Statistics](@ref lib_stat), [Coordinates](@ref
lib_coord), [Geometries](@ref lib_geom), [Guides](@ref lib_guide), 
[Themes](@ref), and/or [Layers](@ref)), and a `mapping` of aesthetics to
columns or expressions of the data.
"""
function plot(data_source, elements::ElementOrFunctionOrLayers...; mapping...)
  return plot(data_source, Dict(mapping), elements...)
end


"""
  plot(elements::ElementOrFunctionOrLayers...; aesthetics...) -> Plot
Create a new plot of the vectors in 'aesthetics'.  Optional `elements`
([Scales](@ref lib_scale), [Statistics](@ref lib_stat), 
[Coordinates](@reflib_coord), [Geometries](@ref lib_geom), 
[Guides](@ref lib_guide), [Themes](@ref), and/or [Layers](@ref)) control the 
layout, labelling, and transformation of the data.
"""
function plot(elements::ElementOrFunctionOrLayers...; mapping...)
  plot(nothing, Dict(mapping), elements...)
end


"""
  plot(
    data_source::Union{Void, AbstractMatrix, AbstractDataFrame},
    mapping::Dict, elements::ElementOrFunctionOrLayers...
  ) -> Plot
The old fashioned (pre-named arguments) version of plot.  This version takes an
explicit mapping dictionary, mapping aesthetics symbols to expressions or
columns in the data frame.
"""
function plot(
    data_source, mapping::Dict, elements::ElementOrFunctionOrLayers...)
  mapping = cleanmapping(mapping)
  p = Plot()
  for element in elements
    add_plot_element!(p, element)
  end
  p.data_source = evalmapping!(mapping, data_source, p.data)
  p.mapping = mapping
  p
end


end # module