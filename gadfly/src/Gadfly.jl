module Gadfly


using Colors
using DataStructures

export Col, plot


const ColorOrNothing = Union{Colorant, (Nothing)}

abstract type Element end
abstract type ScaleElement <: Element end
abstract type CoordinateElement <: Element end
abstract type GeometryElement <: Element end
abstract type GuideElement <: Element end
abstract type StatisticElement <: Element end


# ordering of includes matters!
include("varset.jl")
include("data.jl")
include("aesthetics.jl")
include("mapping.jl")
include("theme.jl")


# The layer and plot functions can also take functions that are evaluated with 
# no args and are expected to produce an element.
const ElementOrFunction{T <: Element} = Union{Element, Base.Callable, Theme}


# A plot has 0 or more layers. Layers have a particular geometry and their own
# data, which is inherited from the plot if not given
mutable struct Layer <: Element
  data_source
  mapping::Dict
  statistics::Vector{StatisticElement}
  geom::GeometryElement
  theme::Union{Nothing, Theme}
  order::Int
end

Layer() = Layer(nothing, Dict(), StatisticElement[], Geom.nil(), nothing, 0)
Layer(l::Layer) = Layer(
  l.data_source, l.mapping, l.statistics, l.geom, l.theme, l.order)
copy(l::Layer) = Layer(l)


# b/c a call to layer() expands a vector of layers (one for each Geom supplied),
# we need to allow Vector{Layer} to count as an Element for the puposes of plot.
const ElementOrFunctionOrLayers = Union{ElementOrFunction, Vector{Layer}}


# Full plot spec
mutable struct Plot
  layers::Vector{Layer}
  data_source
  data::Data
  scales::Vector{ScaleElement}
  statistics::Vector{StatisticElement}
  coord::Union{Nothing, CoordinateElement}
  guides::Vector{GuideElement}
  theme::Theme
  mapping::Dict
end

Plot() = Plot(
    Layer[], nothing, Data(), ScaleElement[], StatisticElement[], nothing, GuideElement[], current_theme(), Dict())


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


# main:
plot(y=[0, 1, 4, 9, 16, 25])

end # module
