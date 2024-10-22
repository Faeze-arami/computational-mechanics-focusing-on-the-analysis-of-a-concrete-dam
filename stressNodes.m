%
% Function stressNodes: stress extrapolations at nodes
%%%%%%%%%%%% it has to be corrected in order to assign the correct value of
%%%%%%%%%%%% dni for aech node contribution
function [dSigmaNSF,dSigmaNav]=stressNodes(dSigma,nInc,nElements,dXY,nNodes,nGtot,dCsiEtaG,dWG,dPar,n_mat1)
  dni=zeros(nNodes,1);% initializing of a vector that collect the dni for each element depending by the material of the element  
  % Extrapolation at nodes with shape functions
  if (nGtot > 1)
    dH=zeros([nNodes,nNodes]);
    dP=zeros([nNodes,3]);
  

    for ne=1:nElements
      n14=nInc(ne,1:4);
      dXnodes=dXY(n14,1);
      dYnodes=dXY(n14,2);
      for ng=1:nGtot
        dxg=dCsiEtaG(ng,1);
        dyg=dCsiEtaG(ng,2);
        dPhi=[(1-dxg)*(1-dyg); (1+dxg)*(1-dyg); (1+dxg)*(1+dyg); (1-dxg)*(1+dyg)]/4;
        dPhidCsi=[-(1-dyg);  (1-dyg); (1+dyg); -(1+dyg)]/4;
        dPhidEta=[-(1-dxg); -(1+dxg); (1+dxg);  (1-dxg)]/4;

        dQmat=dPhidCsi*dPhidEta'-dPhidEta*dPhidCsi';
        ddJ=dXnodes'*dQmat*dYnodes;
     
        dH(n14,n14)=dH(n14,n14)+dWG(ng)*dPhi*dPhi'*abs(ddJ);
        dP(n14,:)=dP(n14,:)+dWG(ng)*dPhi*dSigma(ne,4*ng-3:4*ng-1)*abs(ddJ);        
      end
% added portion, here we insert the corresponding value of the dni for each nodes    %% ATTENTION CHECK IT BECAUSE THIS STEP IMPLY IN THE NODE IN COMMON WITH TWO ELEMENTS OF DIFFERENT MATERIAL TO HAVE THE SUM OF TWO VALUE OF POISSON    
%     dni(n14)=dni(n14)+dPar(ne,2);
for tt=1:nNodes
    hostElements=[];
    [hostElements,position]=find(nInc(:,1:4)==tt) % row contain the elements that contain the nodes tt
    dniNodes=dPar(hostElements,2);
    dni(tt)=mean(dniNodes)
end
    end
  

    dSigmaNSF=dH\dP;
%     dSigmaNSF=[dSigmaNSF,sqrt(dSigmaNSF(:,1).^2+dSigmaNSF(:,2).^2-dSigmaNSF(:,1).*dSigmaNSF(:,2)+3*dSigmaNSF(:,3).^2)];
      dSigmaNSF=[dSigmaNSF,dni.*(dSigmaNSF(:,1)+dSigmaNSF(:,2))]; % changing the value in order to insert the sigma in z direction and not the von mises one   
  else
    dSigmaNSF=zeros([nNodes,4*nGtot]);
  end

  
  % Extrapolation at nodes with nodal average
  dSigmaNav=zeros(size(dSigmaNSF));
  if (nGtot > 1)
    for ne=1:nElements       
      n14=nInc(ne,1:4);
      dXnodes=dXY(n14,1);
      dYnodes=dXY(n14,2);
      dH=zeros([4,4]);
      dP=zeros([4,3]);
      for ng=1:nGtot
        dxg=dCsiEtaG(ng,1);
        dyg=dCsiEtaG(ng,2);
        dPhi=[(1-dxg)*(1-dyg); (1+dxg)*(1-dyg); (1+dxg)*(1+dyg); (1-dxg)*(1+dyg)]/4;
        dPhidCsi=[-(1-dyg);  (1-dyg); (1+dyg); -(1+dyg)]/4;
        dPhidEta=[-(1-dxg); -(1+dxg); (1+dxg);  (1-dxg)]/4;

        dQmat=dPhidCsi*dPhidEta'-dPhidEta*dPhidCsi';
        ddJ=dXnodes'*dQmat*dYnodes;
     
        dH=dH+dWG(ng)*dPhi*dPhi'*abs(ddJ);
        dP=dP+dWG(ng)*dPhi*dSigma(ne,4*ng-3:4*ng-1)*abs(ddJ);
      end
      dSigmaNav(n14,1:3)=dSigmaNav(n14,1:3)+dH\dP;
    end
  elseif (nGtot==1)
    for ne=1:nElements
      n14=nInc(ne,1:4);
      dSigmaNav(n14,1:3)=dSigmaNav(n14,1:3)+ones([4,1])*dSigma(ne,1:3);
    end
  else
    disp('Fatal error')
    STOP
  end
  
  for nn=1:nNodes
    nElsNods=find(nn==nInc(:,1:4));
    nElsNods=length(nElsNods);
    dSigmaNav(nn,1:3)=dSigmaNav(nn,1:3)/nElsNods;
  end
%   dSigmaNav(:,4)=sqrt(dSigmaNav(:,1).^2+dSigmaNav(:,2).^2-dSigmaNav(:,1).*dSigmaNav(:,2)+3*dSigmaNav(:,3).^2);
  dSigmaNav(:,4)=dni.*(dSigmaNav(:,1)+dSigmaNav(:,2)); % changing the value in order to insert the sigma in z direction and not the von mises one   

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
