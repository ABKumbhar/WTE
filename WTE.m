%% Waste to engregy(WTE)
% Aniket Babasaheb Kumbhar(17112014)
% G R Rakshith (17112030)
% Deonar plant - Mumbai WTE model

%% Defining variables
% Subscripts :  
%AD indicates anarobic digestion
% T is non recylable waste
% R is recyclable
% MSW = municipal solid waste
% OF organic fraction
% I is inerts

% Variable x indiactes fraction on dry basis
% T indicates total flow
% All quantites for flow are in tonnes per day

TMSW = 4700;

xOF = 0.5;
xR = 0.186;
xI = 0.125;

% Remaining is non biodegradable waste
xNB = 1-xOF-xR-xI
%M = moisture content average of summer and mansoon
M = (0.5 + 0.65)/2;
% TMSWd = waste on dry basis
TMSWd = 4700*(1-M); 
%C calorific value in kCal/kg
C = 1000;

%% Mass balance
TOF = TMSWd*xOF;
TR = TMSWd*xR;
TI = xI*TMSWd;
% TR is send to another separation plant and we will not consider here
% TI is send to landfill
% Let L indicates landfill amount
L = TMSWd*xI + TMSWd*xNB;

