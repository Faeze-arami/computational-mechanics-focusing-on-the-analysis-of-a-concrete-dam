
% Function Melement: generates the mass matrix for each element

function [mm]=Melement(unitmass,dXY14,thickness,nGtot,dCsiEtaG,dWG)
% Nodal coordinates
    dXnodes = dXY14(:,1);
    dYnodes = dXY14(:,2);
    % Mass matrix
    mm = zeros([4,4]);
    for ng = 1:nGtot
        %
        dxg = dCsiEtaG(ng,1);
        dyg = dCsiEtaG(ng,2);
        %
        dPhi = [(1-dxg)*(1-dyg); (1+dxg)*(1-dyg); (1+dxg)*(1+dyg); (1-dxg)*(1+dyg)]/4;
        dPhidCsi = [-(1-dyg);  (1-dyg); (1+dyg); -(1+dyg)]/4;
        dPhidEta = [-(1-dxg); -(1+dxg); (1+dxg);  (1-dxg)]/4;
        %
        dQmat = dPhidCsi*dPhidEta'-dPhidEta*dPhidCsi';
        ddJ = dXnodes'*dQmat*dYnodes;
        %
        mm = mm + dWG(ng)*thickness*dPhi*unitmass*dPhi'*abs(ddJ);
    end
end

