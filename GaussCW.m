%
% Function GaussCW: defines the coordinates and weights for Gauss integration
%
function [dCsiEtaG,dWG]=GaussCW(nGtot)

  if (nGtot==1)
    dCsiEtaG=[0,0];
    dWG=[4];
  elseif(nGtot==4)
    dCsiEtaG=[-1,-1;
               1,-1;
              -1, 1;
               1, 1]/sqrt(3);
    dWG=[1,1,1,1];
  elseif(nGtot==9)
    dCsiEtaG=[-1,-1;
               0,-1;
               1,-1;
              -1, 0;
               0, 0;
               1, 0;
              -1, 1;
               0, 1;
               1, 1]*sqrt(3/5);
    dWG=[25,40,25,40,64,40,25,40,25]/81;
  elseif(nGtot==16)
    dx1=sqrt((3-2*sqrt(6/5))/7);
    dx2=sqrt((3+2*sqrt(6/5))/7);
    dCsiEtaG=[-dx2,-dx2;
              -dx1,-dx2;
               dx1,-dx2;
               dx2,-dx2;
              -dx2,-dx1;
              -dx1,-dx1;
               dx1,-dx1;
               dx2,-dx1;
              -dx2, dx1;
              -dx1, dx1;
               dx1, dx1;
               dx2, dx1;
              -dx2, dx2;
              -dx1, dx2;
               dx1, dx2;
               dx2, dx2];
    dW1=(18+sqrt(30))/36;
    dW2=(18-sqrt(30))/36;
    dWG=[dW2^2,dW2*dW1,dW2*dW1,dW2^2,dW1*dW2,dW1^2,dW1^2,dW1*dW2,dW1*dW2,dW1^2,dW1^2,dW1*dW2,dW2^2,dW2*dW1,dW2*dW1,dW2^2];
  else
    disp('STOP: change the number of Gauss points')
    return
  end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
