%
% Function nodeconf: displays the nodes of the structure
%
function nodeconf(nNode,dXY,dr)

  for nn=1:nNode
    dxc=dXY(nn,1);
    dyc=dXY(nn,2);
    nt=[0:pi/20:2*pi];
    dx=dxc+dr*cos(nt);
    dy=dyc+dr*sin(nt);
    plot(dx,dy,'r-')
    text(dxc+2*dr,dyc+2*dr,sprintf('%d',nn),'color',[1,0,0],'linewidth',3)
  end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
