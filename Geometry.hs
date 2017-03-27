module Geometry
(sphereVolume,
sphereArea,
cubeVolume,
cubeArea
) where

sphereVolume :: Float -> Float
sphereVolume radius = (4.0/3.0) * pi * (radius^3)

sphereArea :: Float -> Float
sphereArea radius = 4.0 * pi * (radius^2)

cubeArea :: Float -> Float
cubeArea side = 6 * (side^2)

cubeVolume :: Float -> Float
cubeVolume side = cuboidVolume side side side

-- not exported -- private 
cuboidVolume :: Float -> Float -> Float ->Float
cuboidVolume l w h = l*w*h