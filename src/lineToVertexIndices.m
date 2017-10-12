function Idx = lineToVertexIndices(line, mesh)

[linePts, linePos] = intersectLineMesh3d(line, mesh.vertices, mesh.faces);
[linePts, linePtsIdx] = unique(linePts,'rows','stable');
linePos=linePos(linePtsIdx);
if ~isempty(linePos)
    if linePos(1)>linePos(end)
        linePts=flipud(linePts);
        % linePos=flipud(linePos);
    end
end
[~, Idx] = pdist2(mesh.vertices,linePts,'euclidean','Smallest',1);

end