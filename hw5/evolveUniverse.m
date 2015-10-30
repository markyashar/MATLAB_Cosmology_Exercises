function dy = evolveUniverse(t, y)
global param

% We're going to let a = y(1)
%                  phi = y(2)
%             dot(phi) = y(3)
dy = zeros(3,1);
HubbleConst = getHubbleConst(y(1), y(2), y(3), param);

% The first equation is \dot{y}(1) = da/ dt = \sqrt{H}/\sqrt{3}
dy(1) = HubbleConst*y(1);
% The second equation is \dot{phi} = y(3), by definition
dy(2) = y(3);
% The third equation is second derivative of phi = (mess)
dy(3) = -3*HubbleConst*y(3) - dVdPhi(y(2),param);
