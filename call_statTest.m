
function call_statTest()

% Modified from MATLAB violin plot functions by Bastian Bechtold which
% can be found here:
%   https://github.com/bastibe/Violinplot-Matlab
% Contributed by C. M. Belanger Nzakimuena
% $Date: 2020/05/31 $

addpath(genpath('./subFunctions'))

% load and structure data
load fisheriris
setosa_s = meas(1:20,1:2);
setosa_p = meas(1:50,3:4);
virginica_s = meas(101:120,1:2);
virginica_p = meas(101:150,3:4);

% *stripcharts statistical testing*
% specify 1 for t-test, 2 for Mann-Whitney U test
statAnalysis_strip(setosa_s, virginica_s, 2)

% *violin plots statistical testing*
% specify 1 for t-test, 2 for Mann-Whitney U test
statAnalysis_violin(setosa_p, virginica_p, 1)

end