%
% Function mecpar: defines mechanical parameters
%
function [dpar,n_mat1,n_mat2]=mecpar

% %  % Matrix dPar:
% %  % collects Young's modulus and Poisson's coefficient for the material;
% %  % dPar=[E, ni]
% % 
% %   dE=200000;
% %   dni=0;
% %   dPar=[dE, dni];

  
  %% inserisco l'impostastazione di mec par per due parametri 
  n_mat1=132; % number of elements of the first material 
  n_mat2=108; % number of elements of the second material 
  % young modolus
  dE_mat1=4000; % value in N/mm^2 mansory
  dE_mat2=28000; % value in N/mm^2
%   poisson coefficient
  dni_mat1=0.28; % value []
  dni_mat2=0.2;% value []
  for i=1:(n_mat1+n_mat2)
      if i<=n_mat1
      dpar(i,:)=[dE_mat1,dni_mat1];
      else
      dpar(i,:)=[dE_mat2,dni_mat2];
      end
  end    
end  
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
