Ts = 0.005;
T_end = 100;
TFinal=80;
w=6;
w2=0.5;

w3=w;
w4=w2;
g=9.8;
Iyy=0.0000716914;
Ixx=0.0000582857;

time = 0:Ts:T_end;
Data = zeros(T_end/Ts+1,6); % X, Y, Z, Yaw, Pitch, Roll

for i = 0:T_end/Ts+1;
    t = i*Ts;
    if t>60;
        Data(i,1)=0;
        Data(i,2)=0;
        Data(i,3)=-1.5;
        Data(i,4)=-2;
    elseif t>40;
        Data(i,1)=1;
        Data(i,2)=1;
        Data(i,3)=-1.5;
        Data(i,4)=-2;
        
    elseif t>30;
        Data(i,3)=-(t-30)/20-1;
        Data(i,2) = 1;
        Data(i,4)=-(t-30)+8;
    elseif t>13;
        Data(i,2)=1.0;
        Data(i,3)=-1.0;
        Data(i,4)=8.0;
    elseif t>5;
        Data(i,2) =(t-5)/8;
        Data(i,3)=-1.0;
        Data(i,4)=t-5.0;
    elseif t>1;
        Data(i,3) = -1;   % Z
        Data(i,4) = 0;      % Yaw
    end
end


ans = timeseries(single(Data), time, 'Name', 'command');

save('ref.mat', 'ans');

% ホーム/環境/基本設定/Matlab/一般/MATファイル からVersion 7.3を選択
% https://jp.mathworks.com/help/matlab/import_export/mat-file-versions.html