function Output = my_affine_partial_derivative_matrix(Ck,data_point,pra3,pra4,pra5)
%   for weng 畸变模型
%   Ck = [theda,sx,sy,tx,ty,k1,k2,p1,p2,s1,s2]';
%   data_point = [x,y]';
%     x_theda = [-1 * sin(Ck(1)) * Ck(2), -1 * cos(Ck(1))] * data_point; 
%     y_theda = [cos(Ck(1)), -1 * Ck(3) * sin(Ck(1))] * data_point; 
%     x_sx = [cos(Ck(1)),0] * data_point;y_sx = 0;        
%     x_sy = 0;y_sy = [0,cos(Ck(1))] * data_point;               
%     x_tx = 1;y_tx = 0;               
%     x_ty = 0;y_ty = 1;
%     x_k1 = data_point(1)^3 + data_point(1) * data_point(2)^2; y_k1 = 0;
%     x_k2 = 0;y_k2 = data_point(2)^3 + data_point(2) * data_point(1)^2;
%     x_p1 = 3 * data_point(1)^2 + data_point(2)^2;y_p1 = 2 * data_point(1) * data_point(2);
%     x_p2 = 2 * data_point(1) * data_point(2); y_p2 = 3 * data_point(1)^2 + data_point(2)^2;
%     x_s1 = data_point(1)^2 + data_point(2)^2; y_s1 = 0;
%     x_s2 = 0;y_s2 = data_point(1)^2 + data_point(2)^2;
%     Output = [x_theda,y_theda,0;
%                  x_sx,y_sx,0;
%                  x_sy,y_sy,0;
%                  x_tx,y_tx,0;
%                  x_ty,y_ty,0;
%                  x_k1,y_k1,0;
%                  x_k2,y_k2,0;
%                  x_p1,y_p1,0;
%                  x_p2,y_p2,0;
%                  x_s1,y_s1,0;
%                  x_s2,y_s2,0];
%     Output(6:11,:) = 1 .* Output(6:11,:);
%   for 变形3阶
%   Ck = [theda,sx,sy,tx,ty,k1,p1,k2,p2,k3,p3,k4,p4,k5,p5,k6,p6,k7,p7]';
%     x = data_point(1,1);y = data_point(2,1);
%     x_theda = [-1 * sin(Ck(1)) * Ck(2), -1 * cos(Ck(1))] * data_point; 
%     y_theda = [cos(Ck(1)), -1 * Ck(3) * sin(Ck(1))] * data_point; 
%     x_sx = [cos(Ck(1)),0] * data_point;y_sx = 0;        
%     x_sy = 0;y_sy = [0,cos(Ck(1))] * data_point;               
%     x_tx = 1;y_tx = 0;               
%     x_ty = 0;y_ty = 1;
%     x_k1 = x^3;y_k1 = 0;
%     x_p1 = 0;y_p1 = x^3;
%     x_k2 = y^3;y_k2 = 0;
%     x_p2 = 0;y_p2 = y^3;
%     x_k3 = x^2;y_k3 = 0;
%     x_p3 = 0;y_p3 = x^2;
%     x_k4 = y^2;y_k4 = 0;
%     x_p4 = 0;y_p4 = y^2;
%     x_k5 = x*y^2;y_k5 = 0;
%     x_p5 = 0;y_p5 = x*y^2;
%     x_k6 = y*x^2;y_k6 = 0;
%     x_p6 = 0;y_p6 = y*x^2;
%     x_k7 = x*y;y_k7 = 0;
%     x_p7 = 0;y_p7 = x*y;
%     Output = [x_theda,y_theda,0;
%               x_sx,y_sx,0;
%               x_sy,y_sy,0;
%               x_tx,y_tx,0;
%               x_ty,y_ty,0;
%               x_k1,y_k1,0;
%               x_p1,y_p1,0;
%               x_k2,y_k2,0;
%               x_p2,y_p2,0;
%               x_k3,y_k3,0;
%               x_p3,y_p3,0;
%               x_k4,y_k4,0;
%               x_p4,y_p4,0;
%               x_k5,y_k5,0;
%               x_p5,y_p5,0;
%               x_k6,y_k6,0;
%               x_p6,y_p6,0;
%               x_k7,y_k7,0;
%               x_p7,y_p7,0];

%   for 变形4阶
%    Ck = [theda,sx,sy,tx,ty,k1,p1,k2,p2,k3,p3,k4,p4,k5,p5,k6,p6,k7,p7,k8,p8,k9,p9,k10,p10,k11,p11,k12,p12,k13,p13,k14,p14,k15,p15,k16,p16,k17,p17,k18,p18]';
    x = data_point(1,1);y = data_point(2,1);
    x_theda = [-1 * sin(Ck(1)) * Ck(2), -1 * cos(Ck(1))] * data_point; 
    y_theda = [cos(Ck(1)), -1 * Ck(3) * sin(Ck(1))] * data_point; 
    x_sx = [cos(Ck(1)),0] * data_point;y_sx = 0;        
    x_sy = 0;y_sy = [0,cos(Ck(1))] * data_point; 
    x_tx = 1;y_tx = 0;               
    x_ty = 0;y_ty = 1;
    
    x_k1 = x^3;y_k1 = 0;
    x_p1 = 0;y_p1 = x^3;
    x_k2 = y^3;y_k2 = 0;
    x_p2 = 0;y_p2 = y^3;
    x_k3 = x^2;y_k3 = 0;
    x_p3 = 0;y_p3 = x^2;
    x_k4 = y^2;y_k4 = 0;
    x_p4 = 0;y_p4 = y^2;
    x_k5 = x*y^2;y_k5 = 0;
    x_p5 = 0;y_p5 = x*y^2;
    x_k6 = y*x^2;y_k6 = 0;
    x_p6 = 0;y_p6 = y*x^2;
    x_k7 = x*y;y_k7 = 0;
    x_p7 = 0;y_p7 = x*y;
    
    x_k8 = x^4;y_k8 = 0;
    x_p8 = 0;y_p8 = x^4;
    x_k9 = y^4;y_k9 = 0;
    x_p9 = 0;y_p9 = y^4;
    x_k10 = x*y^3;y_k10 = 0;
    x_p10 = 0;y_p10 = x*y^3;
    x_k11 = y*x^3;y_k11 = 0;
    x_p11 = 0;y_p11 = y*x^3;
    x_k12 = (x^2) * (y^2);y_k12 = 0;
    x_p12 = 0;y_p12 = (x^2) * (y^2);
    
    x_k13 = x^5;y_k13 = 0;
    x_p13 = 0;y_p13 = x^5;
    x_k14 = y^5;y_k14 = 0;
    x_p14 = 0;y_p14 = y^5;
    x_k15 = x*(y^4);y_k15 = 0;
    x_p15 = 0;y_p15 = x*(y^4);
    x_k16 = y*(x^4);y_k16 = 0;
    x_p16 = 0; y_p16 = y*(x^4);
    x_k17 = (x^2)*(y^3);y_k17 = 0;
    x_p17 = 0;y_p17 = (x^2)*(y^3);
    x_k18 = (x^3)*(y^2);y_k18 = 0;
    x_p18 = 0;y_p18 = (x^3)*(y^2);
    
    Output = [x_theda,y_theda,0;
              x_sx,y_sx,0;
              x_sy,y_sy,0;
              x_tx,y_tx,0;
              x_ty,y_ty,0;
              x_k1,y_k1,0;
              x_p1,y_p1,0;
              x_k2,y_k2,0;
              x_p2,y_p2,0;
              x_k3,y_k3,0;
              x_p3,y_p3,0;
              x_k4,y_k4,0;
              x_p4,y_p4,0;
              x_k5,y_k5,0;
              x_p5,y_p5,0;
              x_k6,y_k6,0;
              x_p6,y_p6,0;
              x_k7,y_k7,0;
              x_p7,y_p7,0;
              x_k8,y_k8,0;
              x_p8,y_p8,0;
              x_k9,y_k9,0;
              x_p9,y_p9,0;
              x_k10,y_k10,0;
              x_p10,y_p10,0;
              x_k11,y_k11,0;
              x_p11,y_p11,0;
              x_k12,y_k12,0;
              x_p12,y_p12,0;
              x_k13,y_k13,0;
              x_p13,y_p13,0;
              x_k14,y_k14,0;
              x_p14,y_p14,0;
              x_k15,y_k15,0;
              x_p15,y_p15,0;
              x_k16,y_k16,0;
              x_p16,y_p16,0;
              x_k17,y_k17,0;
              x_p17,y_p17,0;
              x_k18,y_k18,0;
              x_p18,y_p18,0]; 
      Output(30:41,:) = pra5 .* Output(30:41,:); 
      Output(20:29,:) = pra4 .* Output(20:29,:);    
      Output(6:19,:) = pra3 .* Output(6:19,:);    
      
      
%       %   for 变形4阶
% %    Ck = [theda,sx,sy,tx,ty,k1,p1,k2,p2,k3,p3,k4,p4,k5,p5,k6,p6,k7,p7,k8,p8,k9,p9,k10,p10,k11,p11,k12,p12]';
%     x = data_point(1,1);y = data_point(2,1);
%     x_theda = [-1 * sin(Ck(1)) * Ck(2), -1 * cos(Ck(1))] * data_point; 
%     y_theda = [cos(Ck(1)), -1 * Ck(3) * sin(Ck(1))] * data_point; 
%     x_sx = [cos(Ck(1)),0] * data_point;y_sx = 0;        
%     x_sy = 0;y_sy = [0,cos(Ck(1))] * data_point; 
%     x_tx = 1;y_tx = 0;               
%     x_ty = 0;y_ty = 1;
%     
%     x_k1 = x^3;y_k1 = 0;
%     x_p1 = 0;y_p1 = x^3;
%     x_k2 = y^3;y_k2 = 0;
%     x_p2 = 0;y_p2 = y^3;
%     x_k3 = x^2;y_k3 = 0;
%     x_p3 = 0;y_p3 = x^2;
%     x_k4 = y^2;y_k4 = 0;
%     x_p4 = 0;y_p4 = y^2;
%     x_k5 = x*y^2;y_k5 = 0;
%     x_p5 = 0;y_p5 = x*y^2;
%     x_k6 = y*x^2;y_k6 = 0;
%     x_p6 = 0;y_p6 = y*x^2;
%     x_k7 = x*y;y_k7 = 0;
%     x_p7 = 0;y_p7 = x*y;
%     
%     x_k8 = x^4;y_k8 = 0;
%     x_p8 = 0;y_p8 = x^4;
%     x_k9 = y^4;y_k9 = 0;
%     x_p9 = 0;y_p9 = y^4;
%     x_k10 = x*y^3;y_k10 = 0;
%     x_p10 = 0;y_p10 = x*y^3;
%     x_k11 = y*x^3;y_k11 = 0;
%     x_p11 = 0;y_p11 = y*x^3;
%     x_k12 = (x^2) * (y^2);y_k12 = 0;
%     x_p12 = 0;y_p12 = (x^2) * (y^2);
%     
%     Output = [x_theda,y_theda,0;
%               x_sx,y_sx,0;
%               x_sy,y_sy,0;
%               x_tx,y_tx,0;
%               x_ty,y_ty,0;
%               x_k1,y_k1,0;
%               x_p1,y_p1,0;
%               x_k2,y_k2,0;
%               x_p2,y_p2,0;
%               x_k3,y_k3,0;
%               x_p3,y_p3,0;
%               x_k4,y_k4,0;
%               x_p4,y_p4,0;
%               x_k5,y_k5,0;
%               x_p5,y_p5,0;
%               x_k6,y_k6,0;
%               x_p6,y_p6,0;
%               x_k7,y_k7,0;
%               x_p7,y_p7,0;
%               x_k8,y_k8,0;
%               x_p8,y_p8,0;
%               x_k9,y_k9,0;
%               x_p9,y_p9,0;
%               x_k10,y_k10,0;
%               x_p10,y_p10,0;
%               x_k11,y_k11,0;
%               x_p11,y_p11,0;
%               x_k12,y_k12,0;
%               x_p12,y_p12,0];      
%       Output(20:29,:) = pra4 .* Output(20:29,:);    
%       Output(6:19,:) = pra3 .* Output(6:19,:);    
      
%   for 张氏标定畸变模型
%   Ck = [k1,k2,k3,p1,p2,theda,sx,sy,tx,ty]';
%     x = data_point(1);y = data_point(2);
%     xx = x - mc(1);yy = y - mc(2);
%     r = xx^2 + yy^2;
%     x_theda = [-1 * sin(Ck(6)) * Ck(7), -1 * cos(Ck(6))] * data_point;
%     y_theda = [cos(Ck(6)), -1 * Ck(8) * sin(Ck(6))] * data_point; 
%     x_sx = [cos(Ck(6)),0] * data_point;y_sx = 0; 
%     x_sy = 0;y_sy = [0,cos(Ck(6))] * data_point; 
%     x_tx = 1;y_tx = 0;               
%     x_ty = 0;y_ty = 1;
%     x_k1 = xx * r;y_k1 = yy * r;
%     x_k2 = xx * r^2;y_k2 = yy * r^2;
%     x_k3 = xx * r^3;y_k3 = yy * r^3;
%     x_p1 = 2 * xx * yy;y_p1 = r + 2 * yy^2;
%     x_p2 = r + 2 * xx^2;y_p2 = 2 * xx * yy;
%     Output = [x_k1,y_k1;
%               x_k2,y_k2;
%               x_k3,y_k3;
%               x_p1,y_p1;
%               x_p2,y_p2;
%               x_theda,y_theda;
%               x_sx,y_sx;
%               x_sy,y_sy;
%               x_tx,y_tx;
%               x_ty,y_ty];   
    
    
    
    
    
    
    
    
    
    
    
    
    
end

