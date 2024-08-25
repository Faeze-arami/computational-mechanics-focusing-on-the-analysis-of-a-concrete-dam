%
% Function figcre: creates the window of a figure
%
function figcre(nF,vCoordFig,vCoordAxes,cTit)

  hF=figure(nF);
  clf
  axis(vCoordAxes);
  hold on
  axis equal
  title(cTit);
  set(hF,'Position',vCoordFig);
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
