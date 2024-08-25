
% function drawstress: plot stress contour

function drawstress(bDrawMesh,bDrawStressSF,bNStress,dSigmaNSF,dSigmaNav,nInc,nElements,dXY)
% fill([0 0 1 1], [0 1 1 0], 'r--')
  if (bDrawStressSF == 1)  
    dSgmN=dSigmaNSF;
  else
    dSgmN=dSigmaNav;
  end  
    
  for ne=1:nElements
   %Nodes of the ne-th element
    n14=nInc(ne,1:4);

   %Nodal coordinates of the ne-th element
    dx=dXY(n14,1);
    dy=dXY(n14,2);
    fill(dx,dy,dSgmN(n14,bNStress));
  end
  colorbar
  
  %Erase the border of the ne-th element
  if (bDrawMesh == 0)
    shading interp
  end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
