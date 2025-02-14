function [fitresult, gof] = createFit(a, avg)
%CREATEFIT(A,AVG)
%  Create a fit.
%
%  Data for 'Graph Betwen' fit:
%      X Input: a
%      Y Output: avg
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 29-Oct-2024 11:35:22


%% Fit: 'Graph Betwen'.
[xData, yData] = prepareCurveData( a, avg );

% Set up fittype and options.
ft = fittype( 'a*exp(-b*x)+c', 'independent', 'x', 'dependent', 'y' );
excludedPoints = (xData < 0) | (yData < 0) ;
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.369246781120215 0.111202755293787 0.780252068321138];
opts.Exclude = excludedPoints;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'Graph Betwen' );
h = plot( fitresult, xData, yData, excludedPoints );
legend( h, 'avg vs. a', 'Excluded avg vs. a', 'Graph Betwen', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'a', 'Interpreter', 'none' );
ylabel( 'avg', 'Interpreter', 'none' );
grid on









