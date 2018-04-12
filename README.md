# imageSimplicialComplex
Turns image into Rips Complex so that it can be analyzed using topological data analysis

The input is a grayscale image, so, essentially a matrix with values between 0 and 1 for each of its element. The pixels were assigned an order. Each pixel was considered a vertex where the first value was its place value in the assigned order  and the second value was its grayscale value. The goal was to create a list of edges between each pair of horizontally adjacent vertices (pixels) and each pair of vertically adjacent vertices, along with some diagonal edges. 
