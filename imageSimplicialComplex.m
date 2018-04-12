function [imageSimplex] = createSimplex(x)        %where x is some matrix (image)
[m n] = size(x)

numVerts = m*n                 %assign number to each pixel; each number will be the pixel's corresponding vertex
verts = zeros(numVerts,3);

verts(:,1) = 1:numVerts;
verts(:,2) = 1:numVerts;
verts(:,3) = x(:);                   %associated grayscale value with each vertex (pixel)

horzEdges(:,1) = 1:numVerts-m;      %list of lefthand vertex of horizontal edge
horzEdges(:,2) = (m+1):numVerts;     %list of righthand vertex of each horizontal edge
horzEdges(:,3) = max(x(horzEdges(:,1)),x(horzEdges(:,2))); %use larger gryscale val of edge

mask = rem(1:numVerts,m) ~=0;    %create mask where there is a 0 for every bottom vertex %(pixel) since there can’t be vertical edges on the bottom row of vertices

vertEdges(:,1) = (1:numVerts).*mask;         %top vertex of each vertical edge
vertEdges(:,2) = (2:numVerts+1).*mask;     %bottom vertex of each vertical edge
vertEdges( ~any(vertEdges,2), : ) =[];         %take out rows of zeroes
vertEdges(:,3) = max(x(vertEdges(:,1)),x(vertEdges(:,2)));

mask2 = rem(1:numVerts-m,m) ~=0;         %same idea applied to diagonal edges
diagEdges(:,1) = (1:numVerts-m).*mask2;
diagEdges(:,2) = (m+2:numVerts+1).*mask2;
diagEdges( ~any(diagEdges,2), : ) =[];
diagEdges(:,3) = max(x(diagEdges(:,1)),x(diagEdges(:,2)));

imageSimplex = vertcat(verts,horzEdges,vertEdges,diagEdges); %feed list of vertices, edges
end
