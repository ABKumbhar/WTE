%% Waste to engregy(WTE)
% Aniket Babasaheb Kumbhar(17112014)
% G R Rakshith (17112030)
% Deonar plant - Mumbai WTE model

%% Defining variables
% Subscripts :  
%AD indicates anarobic digestion
% R is recyclable
% MSW = municipal solid waste
% OC organic content
% I is inerts

% Variable x indiactes fraction on dry basis
% T indicates total flow
% All quantites for flow are in tonnes per day

TMSW = 4700;

xOC = 0.5;
xR = 0.186;
xI = 0.125;

% Remaining is non biodegradable waste
xNB = 1-xOC-xR-xI
%M = moisture content average of summer and mansoon
M = (0.5 + 0.65)/2;
%C calorific value in kCal/kg
C = 1000;

%% Mass balance
% TMSWd = waste on dry basis
TMSWd = 4700*(1-M); 
%TMSWm = total water content
TMSWm = TMSW - TMSWd
TOC = TMSWd*xOC;
TR = TMSWd*xR;
TI = xI*TMSWd;
% TR is send to another separation plant and we will not consider here
% TI is send to landfill
% Let L indicates landfill amount
L = TMSWd*xI + TMSWd*xNB;
% Waste entering in anaerobic digestor is AD
%But we need to check the dry content in TAD if it is more than 8% we need
%to add water
% xdAD = fraction of dry content in anaerobic digestor
% WAD = additional water need to be added if the solid content is not in
% the range of 25%-40%
WAD = 0;
TAD = TOC + TMSWm + WAD ;

xdAD = TOC/TAD

% Check the dry content range
if (xdAD >= (0.25)  || xdAD <= (0.4))
    WAD=0;
else 
    TAD = TOC/0.08
    WAD = TAD - TOC - TMSWm
    xdAD = TOC/TAD
end

%% Energy Balance
% For methane production





