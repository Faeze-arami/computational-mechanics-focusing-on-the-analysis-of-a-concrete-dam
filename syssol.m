%
% Function syssol: solves the equation system
%
function [du,dR, evals, evecs]=syssol(dK,dM, dT,nUu,nUs,dUs,nDofTot)

% Sub-matrices in the solving system
% Partitioning the global Stiffness Matrix dK
 dKuu=dK(nUu,nUu);
 dKus=dK(nUu,nUs);
 dKsu=dK(nUs,nUu);
 dKss=dK(nUs,nUs);
 
 % Eigenvalues and Eigenvectors
 dMuu=dM(nUu,nUu);
 [evecs, evals] = eig(dKuu,dMuu);
 evals = diag(evals);
 [evals,I]=sort(evals);
 evecs=evecs(:,I);
 temp = zeros(nDofTot,length(evals));
 temp(nUu,:) = evecs;
 evecs = temp;

% Partitioning known terms collected by vector dT
 dTu=dT(nUu,1);
 dTs=dT(nUs,1);

% Solution 
% Computing unknown Displacements 
 dUu=dKuu\(dTu-dKus*dUs);

% Computing reaction forces
 dRs=dKsu*dUu+dKss*dUs-dTs;

% Recovering nodal displacements following the original node numbering
 du=zeros([nDofTot,1]);
 du(nUu,1)=dUu;
 du(nUs,1)=dUs;

% Recovering rection forces in the original node numbering
 dR=zeros([nDofTot,1]);
 dR(nUs,1)=dRs;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
