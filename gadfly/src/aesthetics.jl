using Measures

const CategoricalAesthetic = Union{Nothing, IndirectArray}
const NumericalAesthetic = Union{Nothing, AbstractMatrix, AbstractVector}
const NumericalOrCategoricalAesthetic = Union{CategoricalAesthetic, 
                                              NumericalAesthetic}

@varset Aesthetics begin
  x,    Union{NumericalOrCategoricalAesthetic, Distribution}
  y,    Union{NumericalOrCategoricalAesthetic, Distribution}
  z,    Union{Nothing, Function, NumericalAesthetic}
  xend, NumericalAesthetic
  yend, NumericalAesthetic

  size,      Union{CategoricalAesthetic, Vector, Nothing}
  shape,     Union{CategoricalAesthetic, Vector, Nothing}
  color,     Union{CategoricalAesthetic, Vector, Nothing}
  alpha,     NumericalOrCategoricalAesthetic
  linestyle, Union{CategoricalAesthetic, Vector, Nothing}

  label, CategoricalAesthetic
  group, CategoricalAesthetic

  xmin, NumericalAesthetic
  xmax, NumericalAesthetic
  ymin, NumericalAesthetic
  ymax, NumericalAesthetic

  # hexagon sizes used for hexbin
  xsize, NumericalAesthetic
  ysize, NumericalAesthetic

  # fixed lines
  xintercept, NumericalAesthetic
  yintercept, NumericalAesthetic
  intercept,  NumericalAesthetic
  slope,      NumericalAesthetic

  # boxplots
  middle,      NumericalAesthetic
  lower_hinge, NumericalAesthetic
  upper_hinge, NumericalAesthetic
  lower_fence, NumericalAesthetic
  upper_fence, NumericalAesthetic
  outliers,    NumericalAesthetic
  width,       NumericalAesthetic

  # subplots
  xgroup, CategoricalAesthetic
  ygroup, CategoricalAesthetic

  # guides
  xtick,                NumericalAesthetic
  ytick,                NumericalAesthetic
  xgrid,                NumericalAesthetic
  ygrid,                NumericalAesthetic
  color_key_colors,     Maybe(AbstractDict)
  color_key_title,      Maybe(AbstractString)
  color_key_continuous, Maybe(Bool)
  color_function,       Maybe(Function)
  titles,               Maybe(Dict{Symbol, AbstractString})
  shape_key_title,      Maybe(AbstractString)
  size_key_title,       Maybe(AbstractString)
  size_key_vals,        Maybe(AbstractDict)

  # mark some ticks as initially invisible
  xtickvisible, Maybe(Vector{Bool})
  ytickvisible, Maybe(Vector{Bool})

  # scale at which ticks should become visible
  xtickscale, Maybe(Vector{Bool})
  ytickscale, Maybe(Vector{Bool})

  # plot viewport extents
  xviewmin, Any
  xviewmax, Any
  yviewmin, Any
  yviewmax, Any

  # labeling functions
  x_label,      Function, showoff
  y_label,      Function, showoff
  xtick_label,  Function, showoff
  ytick_label,  Function, showoff
  color_label,  Function, showoff
  xgroup_label, Function, showoff
  ygroup_label, Function, showoff
  shape_label,  Function, showoff
  size_label,   Function, showoff

  # pseudo-aesthetics
  pad_categorical_x, Union{Missing, Bool}, missing
  pad_categorical_y, Union{Missing, Bool}, missing
end