%
% Function assilc: assigns boundary conditions (nodal loads and constraints)
%
function [nUs,dUs,nUu,dT]=assilc(nInc,nForce,dF,nCons,dC,npq,dpq,dXY,thickness,nDofTot,nGtot,dCsiEtaG,dWG)
                                 
% Constrained displacements
% nUs=zeros([nCons,1]);
% dUs=zeros([nCons,1]);
% for nv=1:nCons
%   nn=dC(nc,1); %Number of constrained node 
%   ni=2*(nn-1)+dC(nc,2); %Constrained dof
%   nUs(nc,1)=ni; %Collects the constrained dof in vector nUs
%   dUs(nc,1)=dCs(nc,3); %Collects the imposed displacement in vector dUs
% end
% All together: 
  nUs=2*dC(:,1)-2*ones([nCons,1])+dC(:,2);
  dUs=dC(:,3);

% Sorts constrained dofs and corresponding imposed displacements
 [nUs,nI]=sort(nUs);
 dUs=dUs(nI,1);

% Free (unconstrained) Dofs
 nUu=[1:nDofTot]';
 nUu(nUs)=[];

% Known terms in the unconstrained structures
 dT=zeros([nDofTot,1]);

% Collect force components in vector dT
 for nf=1:nForce
   nn=dF(nf,1); % Number of loaded node 
   ni=2*(nn-1)+dF(nf,2); % Loaded Dof
   dT(ni,1)=dT(ni,1)+dF(nf,3); % Force intensity
 end
 
 
 if npq>0
 % Distributed (uniform) loads
   for nf=1:npq
     ne=dpq(nf,1); % Number of loaded element 
     n14=nInc(ne,1:4);
     dXnodes=dXY(n14,1);
     dYnodes=dXY(n14,2);

     dTpq=zeros([8,1]);
     for ng=1:nGtot
       dxg=dCsiEtaG(ng,1);
       dyg=dCsiEtaG(ng,2);
       dPhi=[(1-dxg)*(1-dyg); (1+dxg)*(1-dyg); (1+dxg)*(1+dyg); (1-dxg)*(1+dyg)]/4;
       dPhidCsi=[-(1-dyg);  (1-dyg); (1+dyg); -(1+dyg)]/4;
       dPhidEta=[-(1-dxg); -(1+dxg); (1+dxg);  (1-dxg)]/4;

       dQmat=dPhidCsi*dPhidEta'-dPhidEta*dPhidCsi';
       ddJ=dXnodes'*dQmat*dYnodes;

       dTpq(1:2:end,1)=dTpq(1:2:end,1)+dWG(ng)*thickness*dPhi*dpq(nf,2)*abs(ddJ);   
       dTpq(2:2:end,1)=dTpq(2:2:end,1)+dWG(ng)*thickness*dPhi*dpq(nf,3)*abs(ddJ);   
     end
     nVne=nInc(ne,5:12);
     dT(nVne,1)=dT(nVne,1)+dTpq;
   end
 end
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
