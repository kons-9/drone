Ts = 0.005;
T_end = 100;

time = 0:Ts:T_end;
Data = zeros(T_end/Ts+1,6); % X, Y, Z, Yaw, Pitch, Roll

for i = 0:T_end/Ts+1;
    t = i*Ts;
    if t>5;
        Data(i,1) =1;
%         Data(i,2)=0.5;
        Data(i,3) = -1;   % Z
        Data(i,4) = 0;      % Yaw
%         Data(i,5) = 0.1;
    elseif t>1;
        Data(i,3) = -1;   % Z
        Data(i,4) = 0;      % Yaw
    end
end


ans = timeseries(single(Data), time, 'Name', 'command');

save('ref.mat', 'ans');

% ホーム/環境/基本設定/Matlab/一般/MATファイル からVersion 7.3を選択
% https://jp.mathworks.com/help/matlab/import_export/mat-file-versions.html