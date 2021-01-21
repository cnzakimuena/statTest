
function [vioData, vioLabels] = violinData1(paraData, specSize)

vecSize = 0;
for g = 1:specSize 
   currSize = size(paraData(:,g),1);  
   vecSize = vecSize + currSize; 
end
% violins will be ordered alphabetically
regNames = 'a1'; % violins will be 
vecStart = 1;
vioData = zeros(vecSize,1);
vioLabels = cell(vecSize,1);
for k = 1:specSize
    sampSize = size(paraData(:,k),1);
    vecEnd = vecStart + sampSize - 1;
    vioData(vecStart:vecEnd,1) = paraData(:,k);
    vioLabels(vecStart:vecEnd) = {regNames(k,1:2)};
    vecStart = vecStart + sampSize;
end

end