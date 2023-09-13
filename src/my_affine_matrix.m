function Ak = my_affine_matrix(Ck,pra3,pra4,pra5)
%   此处显示详细说明
%   for weng 畸变模型
%     Ck = [theda,sx,sy,tx,ty,k1,k2,p1,p2,s1,s2]';
%     Ck(6:11,1) = 1 .* Ck(6:11,1);
%     Ak = [Ck(2)*cos(Ck(1)),sin(Ck(1)),0;      %Ck: | sx*cos(theda) sin(theda)    0 |
%           -1*sin(Ck(1)),Ck(3)*cos(Ck(1)),0;   %    | -sin(theda)   sy*cos(theda) 0 |
%           Ck(4),Ck(5),1;                      %    | tx            ty            1 |
%           Ck(6),0,0;                          %    | k1            0             0 |
%           0,Ck(7),0;                          %    | 0             k2            0 |
%           3*Ck(8)+Ck(10),3*Ck(9)+Ck(11),0;    %    | 3*p1+s1       3*p2+s2       0 |  
%           Ck(8)+Ck(10),Ck(9)+Ck(11),0;        %    | p1+s1         p2+s2         0 |
%           Ck(6),0,0;                          %    | k1            0             0 |
%           0,Ck(7),0;                          %    | 0             k2            0 |
%           2*Ck(9),2*Ck(8),0];                 %    | 2*p2          2*p1          0 |
%   for 张氏标定畸变模型
%   Ck = [k1,k2,k3,p1,p2,theda,sx,sy,tx,ty]';
%     Ak = [Ck(1),Ck(2),Ck(3),Ck(4),Ck(5),Ck(7)*cos(Ck(6)),-1*sin(Ck(6)),Ck(9),sin(Ck(6)),Ck(8)*cos(Ck(6)),Ck(10)];
%   for 变形3阶
%   Ck = [theda,sx,sy,tx,ty,k1,p1,k2,p2,k3,p3,k4,p4,k5,p5,k6,p6,k7,p7]';
%     Ak = [Ck(2)*cos(Ck(1)),sin(Ck(1)),0;      %    | sx*cos(theda) sin(theda)    0 |
%           -1*sin(Ck(1)),Ck(3)*cos(Ck(1)),0;   %    | -sin(theda)   sy*cos(theda) 0 |
%           Ck(4),Ck(5),1;                      %    | tx            ty            1 |
%           Ck(6),Ck(7),0;                      %    | k1            p1            0 |
%           Ck(8),Ck(9),0;                      %    | k2            p2            0 |
%           Ck(10),Ck(11),0;                    %    | k3            p3            0 |
%           Ck(12),Ck(13),0;                    %    | k4            p4            0 |
%           Ck(14),Ck(15),0;                    %    | k5            p5            0 |
%           Ck(16),Ck(17),0;                    %    | k6            p6            0 |
%           Ck(18),Ck(19),0];                   %    | k7            p7            0 |
%   for 变形4阶
%    Ck = [theda,sx,sy,tx,ty,k1,p1,k2,p2,k3,p3,k4,p4,k5,p5,k6,p6,k7,p7,k8,p8,k9,p9,k10,p10,k11,p11,k12,p12]';
%     Ck(20:29,1) = pra4 .* Ck(20:29,1);
%     Ck(6:19,1) = pra3 .* Ck(6:19,1);
%     Ak = [Ck(2)*cos(Ck(1)),sin(Ck(1)),0;      %    | sx*cos(theda) sin(theda)    0 |
%           -1*sin(Ck(1)),Ck(3)*cos(Ck(1)),0;   %    | -sin(theda)   sy*cos(theda) 0 |
%           Ck(4),Ck(5),1;                      %    | tx            ty            1 |
%           Ck(6),Ck(7),0;                      %    | k1            p1            0 |
%           Ck(8),Ck(9),0;                      %    | k2            p2            0 |
%           Ck(10),Ck(11),0;                    %    | k3            p3            0 |
%           Ck(12),Ck(13),0;                    %    | k4            p4            0 |
%           Ck(14),Ck(15),0;                    %    | k5            p5            0 |
%           Ck(16),Ck(17),0;                    %    | k6            p6            0 |
%           Ck(18),Ck(19),0;                    %    | k7            p7            0 |
%           Ck(20),Ck(21),0;                    %    | k8            p8            0 |
%           Ck(22),Ck(23),0;                    %    | k9            p9            0 |
%           Ck(24),Ck(25),0;                    %    | k10           p10           0 |
%           Ck(26),Ck(27),0;                    %    | k11           p11           0 |
%           Ck(28),Ck(29),0];                   %    | k12           p12           0 |  
      
%       Ck = [theda,sx,sy,tx,ty,k1,p1,k2,p2,k3,p3,k4,p4,k5,p5,k6,p6,k7,p7,k8,p8,k9,p9,k10,p10,k11,p11,k12,p12,k13,p13,k14,p14,k15,p15,k16,p16,k17,p17,k18,p18]';
        Ck(20:29,1) = pra4 .* Ck(20:29,1);
        Ck(6:19,1) = pra3 .* Ck(6:19,1);
        Ck(30:41,1) = pra5 .* Ck(30:41,1);
        Ak = [Ck(2)*cos(Ck(1)),sin(Ck(1)),0;      %    | sx*cos(theda) sin(theda)    0 |
              -1*sin(Ck(1)),Ck(3)*cos(Ck(1)),0;   %    | -sin(theda)   sy*cos(theda) 0 |
              Ck(4),Ck(5),1;                      %    | tx            ty            1 |
              Ck(6),Ck(7),0;                      %    | k1            p1            0 |
              Ck(8),Ck(9),0;                      %    | k2            p2            0 |
              Ck(10),Ck(11),0;                    %    | k3            p3            0 |
              Ck(12),Ck(13),0;                    %    | k4            p4            0 |
              Ck(14),Ck(15),0;                    %    | k5            p5            0 |
              Ck(16),Ck(17),0;                    %    | k6            p6            0 |
              Ck(18),Ck(19),0;                    %    | k7            p7            0 |
              Ck(20),Ck(21),0;                    %    | k8            p8            0 |
              Ck(22),Ck(23),0;                    %    | k9            p9            0 |
              Ck(24),Ck(25),0;                    %    | k10           p10           0 |
              Ck(26),Ck(27),0;                    %    | k11           p11           0 |
              Ck(28),Ck(29),0;                    %    | k12           p12           0 |    
              Ck(30),Ck(31),0;                    %    | k13           p13           0 | 
              Ck(32),Ck(33),0                     %    | k14           p14           0 | 
              Ck(34),Ck(35),0                     %    | k15           p15           0 |
              Ck(36),Ck(37),0                     %    | k16           p16           0 |
              Ck(38),Ck(39),0                     %    | k17           p17           0 |
              Ck(40),Ck(41),0];                   %    | k18           p18           0 |
end

