6.1.2 Geometry

6.1.2.1 Description 

Geometry is the root class of the hierarchy. Geometry is an abstract (non-instantiable) class.
The instantiable subclasses of Geometry defined in this Standard are restricted to 0, 1 and
2-dimensional geometric objects that exist in 2, 3 or 4-dimensional coordinate space. 
Geometry values in R2 have points with coordinate values for x and y. Geometry values in R3 have points with coordinate
values for x, y and z or for x, y and m. Geometry values in R4 have points with coordinate values for x, y, z and m.
The interpretation of the coordinates is subject to the coordinate reference systems associated to the point. All
coordinates within a geometry object should be in the same coordinate reference systems. Each coordinate shall
be unambiguously associated to a coordinate reference system either directly or through its containing geometry.
The z coordinate of a point is typically, but not necessarily, represents altitude or elevation. The m coordinate
represents a measurement.
All Geometry classes described in this standard are defined so that instances of Geometry are topologically
closed, i.e. all represented geometries include their boundary as point sets. This does not affect their 