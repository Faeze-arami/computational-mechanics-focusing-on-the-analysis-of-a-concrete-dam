%
% Function memconf: displays the structural members
%
function memconf(bElemLabels,nElements,nInc,dXY,sSt)

 %Draw members
 for ne=1:nElements
  %Nodes of the ne-th element 
   n14=nInc(ne,[1:4,1]);

  %Nodal coordinates of the ne-th element
   dx=dXY(n14,1);
   dy=dXY(n14,2);

  %Draw the ne-th element
   plot(dx,dy,sSt)
   
   if (bElemLabels == 1)
     dxtext=mean(dx(1:4));
     dytext=mean(dy(1:4));
     text(dxtext,dytext,sprintf('%d',ne),'color',[0,0,1],'linewidth',3);
   end
 end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
