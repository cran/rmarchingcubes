## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(rmarchingcubes)

## ----generating_inputs--------------------------------------------------------
# Function to generate values decreasing in a sphere-like way
f <- function(coords) coords[1]^2 + coords[2]^2 + coords[3]^2

# Set grid coordinates at which to calculate values
x <- seq(-2,2,len = 20)
y <- seq(-2,2,len = 20)
z <- seq(-2,2,len = 20)

# Calculate values across grid coordinates
grid_coords <- expand.grid(x, y, z)
grid_values <- apply(grid_coords, 1, f)

# Convert to a 3d array
grid_array <- array(grid_values, dim = c(length(x), length(y), length(z)))

## ----calculating_contour------------------------------------------------------
# Calculate 3d contour from the grid data at a contour level of value 4
contour_shape <- contour3d(
  griddata = grid_array, 
  level = 4,
  x = x,
  y = y,
  z = z
)

## ----viewing_contour, eval=FALSE----------------------------------------------
#  # Optionally view the output using the r3js package
#  # devtools::install_github("shwilks/r3js")
#  
#  # Setup plot object
#  data3js <- r3js::plot3js(
#    x = x,
#    y = y,
#    z = z,
#    type = "n"
#  )
#  
#  # Add shape according to the calculated contours
#  data3js <- r3js::shape3js(
#    data3js,
#    vertices = contour_shape$vertices,
#    faces = contour_shape$triangles,
#    normals = contour_shape$normals,
#    col = "red"
#  )
#  
#  # View the plot
#  r3js::r3js(data3js)

