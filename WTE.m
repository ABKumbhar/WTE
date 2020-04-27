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
M = 0.7269;
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
% WAD = additional water need to be added if the solid content is not less than 40%
WAD = 0;
TAD = TOC + TMSWm + WAD ;

xdAD = TOC/TAD

% Check the dry content range
if ( xdAD <= (0.4))
    WAD=0;
else 
    TAD = TOC/0.4
    WAD = TAD - TOC - TMSWm
    xdAD = TOC/TAD
end

%% Energy Balance
% For methane production
% VS is volatile solid content (data taken from an average MSW facility, not
% actual deonar)
% C carbon percentage/fraction at Deonar
% HRT hydraulic rentention time = 10 to 15 days = avg 12.5 days

%Rate constant for methane formation is 0.12 h^(-1)
% Determination of Methane and Carbon Dioxide Formation Rate Constants for Semi-Continuously Fed Anaerobic Digesters
%Jan Moestedt 1,2,†, Jonas Malmborg 1,†,‡ and Erik Nordell 1,†,*

% y = Methane yield is about 221 mlCH4/gVS of VS (need to convert to
% dimensionaless variable

HRT = 12.5
k = 0.12*24
xVS = 0.394
xC = 0.4458
yCH4_maxinlab = 221
yCH4_maxindigestor = HRT*k*(yCH4_maxinlab)/(HRT*k + 1)
% TCH4 methane (in m^3) produced per day
TCH4_m3perday = yCH4_maxindigestor*xVS*TAD

% Assume that all volatiles




