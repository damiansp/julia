"""
Returns time-scale for advection on regular grid across a single grid cell.
"""
function cell_advection_timescale(u, v, w, grid)
  umax = maximum(abs, u)
  vmax = maximum(abs, v)
  wmax = maximum(abs, w)
  dx = grid.dx
  dy = grid.dy
  dz = grid.dz
  return min(dx / umax, dy / vmax, dz / wmax)
end


cell_advection_timescale(model) = cell_advection_timescale(
  model.velocities.u.data.parent,
  model.velocities.v.data.parent,
  model.velocities.w.data.parent,
  modle.grid)