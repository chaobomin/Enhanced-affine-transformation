close all;
clc;
clear data;
clear all;

%=== Nonrigid registration of IR and VIS images via EAT ===%
if 1
    addpath('.\img_data_n'); 
    addpath('.\fp_n');
    addpath('.\src');
end

f = 1;
img_ir = imread(['./img_data_n/',num2str(f),'_ir.bmp']);img_ir = img_ir(:,:,1);
img_vis = imread(['./img_data_n/',num2str(f),'_vis.bmp']);img_vis = rgb2gray(img_vis);img_vis = img_vis(:,:,1);

figure,subplot(1,2,1),imshow(img_ir);hold on
subplot(1,2,2),imshow(img_vis);hold on

img_ir_edge = edge(img_ir,'canny');
img_vis_edge = edge(img_vis,'canny');

[y,x] = find(img_ir_edge == 1);
point_ir = zeros(2,length(x));
point_ir(1,:) = x';
point_ir(2,:) = y';

[y,x] = find(img_vis_edge == 1);
point_vis = zeros(2,length(x));
point_vis(1,:) = x';
point_vis(2,:) = y';

load(['./fp_n/',num2str(f),'ab-5.mat']);
mode_point_o = pt_vis_d;
data_point_o = pt_ir_d;
scale = 1;
mode_point = pt_vis_d./scale;
data_point = pt_ir_d./scale;

figure;
plot(mode_point(1,:),mode_point(2,:),'ro','LineWidth',2);hold on
plot(data_point(1,:),data_point(2,:),'+','Color',[0/255 0/255 139/255],'LineWidth',2);hold on

tic
parameter.std_d = 6;
parameter.lamd = 0.02;
%====parameter setting for IR and VIS images with highly non-linear deformation====%  
%(f = 1 2 3 4 5)%
parameter.pra3 = 2e-4;
parameter.pra4 = 1e-4;
parameter.pra5 = 1e-7;
%====parameter setting for IR and VIS images with low non-linear deformation====%   
%(f = 5 6 7 8 9)%
% parameter.pra3 = 2e-10;
% parameter.pra4 = 1e-10;
% parameter.pra5 = 1e-14;

[Ako,constuct_data_point] = Nonrigid_registration_EAT(mode_point,data_point,parameter);

constuct_data_point_k = (constuct_data_point * Ako)';
data_point_r = constuct_data_point_k(1:2,:);
tc = toc;
plot(data_point_r(1,:),data_point_r(2,:),'+','Color',[255/255 130/255 71/255],'LineWidth',2);hold on

figure;title('C');hold on
plot(mode_point(1,:),mode_point(2,:),'ro','LineWidth',2);hold on
plot(data_point_r(1,:),data_point_r(2,:),'+','Color',[0/255 139/255 0/255],'LineWidth',2);hold on

% save(['Ako-',num2str(f),'-15-std=',num2str(std_d),'-5J.mat'],'Ako');
% save(['Ako-',num2str(f),'-15-std=',num2str(std_d),'-1J-withoutsc.mat'],'Ako');

%% used to registration for edge image
clear mode_point data_point constuct_data_point;
mode_point = point_vis./scale;
data_point = point_ir./scale;
constuct_data_point = zeros(length(data_point),21);%4 -- 15
for i = 1 : length(data_point)
    x = data_point(1,i);
    y = data_point(2,i);
    %constuct_data_point(i,:) = [x,y,1,a3 * x^3,a3 * y^3,a3 * x^2,a3 * y^2,a3 * x*(y^2),a3 * y*(x^2),a3 * x*y,a4 * x^4,a4 * y^4,a4 * x*(y^3),a4 * y*(x^3),a4 * (x^2)*(y^2)];
    constuct_data_point(i,:) = [x,y,1,x^3,y^3,x^2,y^2,x*(y^2),y*(x^2),x*y,x^4,y^4,x*(y^3),y*(x^3),(x^2)*(y^2),x^5,y^5,x*(y^4),y*(x^4),(x^2)*(y^3),(x^3)*(y^2)];
    %constuct_data_point(i,:) = [x,y,1,x^4,y^4,x*(y^3),y*(x^3),(x^2)*(y^2),x^3,y^3,x*(y^2),y*(x^2),x^2,y^2,x*y];
end
constuct_data_point_f = (constuct_data_point * Ako)';
data_point_f = constuct_data_point_f(1:2,:);

mode_point = floor(scale .* mode_point);
data_point = floor(scale .* data_point);
data_point_f = floor(scale .* data_point_f);

[rows,cols] = size(img_vis);
img_d = 255 .* ones(rows,cols,3);
for i = 1 : length(mode_point)
    img_d(mode_point(2,i),mode_point(1,i),1) = 255;
    img_d(mode_point(2,i),mode_point(1,i),2) = 0;
    img_d(mode_point(2,i),mode_point(1,i),3) = 0;
end
for i = 1 : length(data_point_f)
    if(data_point_f(1,i) > 0 && data_point_f(2,i) > 0 && data_point_f(1,i) < cols && data_point_f(2,i) < rows)
        img_d(data_point_f(2,i),data_point_f(1,i),1) = 0;
        img_d(data_point_f(2,i),data_point_f(1,i),2) = 0;
        img_d(data_point_f(2,i),data_point_f(1,i),3) = 255;
    end
end
figure,imshow(uint8(img_d));title('registration result');hold on

img_o = 255 .* ones(rows,cols,3);
for i = 1 : length(mode_point)
    img_o(mode_point(2,i),mode_point(1,i),1) = 255;
    img_o(mode_point(2,i),mode_point(1,i),2) = 0;
    img_o(mode_point(2,i),mode_point(1,i),3) = 0;
end
for i = 1 : length(data_point)
    if(data_point(1,i) > 0 && data_point(2,i) > 0)
        img_o(data_point(2,i),data_point(1,i),1) = 0;
        img_o(data_point(2,i),data_point(1,i),2) = 0;
        img_o(data_point(2,i),data_point(1,i),3) = 255;
    end
end
figure,imshow(uint8(img_o));title('original');hold on

%% ==============image registration================%%
[y,x] = find(img_ir >= 0);
point_ir = zeros(2,length(x));
point_ir(1,:) = x';
point_ir(2,:) = y';

[y,x] = find(img_vis >= 0);
point_vis = zeros(2,length(x));
point_vis(1,:) = x';
point_vis(2,:) = y';

mode_point_e = point_vis;
data_point_e = point_ir;
constuct_data_point = zeros(length(data_point_e),21);%4 -- 15
for i = 1 : length(data_point_e)
    x = data_point_e(1,i);
    y = data_point_e(2,i);   
    constuct_data_point(i,:) = [x,y,1,x^3,y^3,x^2,y^2,x*(y^2),y*(x^2),x*y,x^4,y^4,x*(y^3),y*(x^3),(x^2)*(y^2),x^5,y^5,x*(y^4),y*(x^4),(x^2)*(y^3),(x^3)*(y^2)];
end
constuct_data_point_k = (constuct_data_point * Ako)';
data_point_er = floor(constuct_data_point_k(1:2,:));

img_r = -1 .* ones(rows,cols);

for i = 1 : length(data_point_er)
    if(data_point_er(1,i) <= cols && data_point_er(2,i) <= rows && data_point_er(1,i) > 0 && data_point_er(2,i) > 0)
        img_r(data_point_er(2,i),data_point_er(1,i)) = img_ir(data_point_e(2,i),data_point_e(1,i));
    end
end

map = ones(rows,cols);
map(img_r(:,:) == -1) = 0;

img_rr = img_r;
for i = 2 : rows-1
    for j = 2 : cols-1
        if(img_r(i,j) == -1)
            img_rr(i,j) = (map(i-1,j) * img_r(i-1,j) + map(i+1,j) * img_r(i+1,j) + map(i,j-1) * img_r(i,j-1) + map(i,j+1) * img_r(i,j+1)...
                + map(i-1,j-1) * img_r(i-1,j-1) + map(i-1,j+1) * img_r(i-1,j+1) + map(i+1,j-1) * img_r(i+1,j-1) + map(i+1,j+1) * img_r(i+1,j+1)) ...
                / (map(i-1,j) + map(i+1,j) + map(i,j-1) + map(i,j+1) + map(i-1,j-1) + map(i-1,j+1) + map(i+1,j-1) + map(i+1,j+1));
        end
    end
end

FI_EA = fusion_bilateral(double(img_vis),double(img_rr));
figure,imshow(FI_EA);title('EAT');hold on

FI = fusion_bilateral(double(img_vis),double(img_ir));
figure,imshow(FI);title('O');hold on

h1 = figure;
iic = 0;
while(iic < 4)
    iic = iic + 1;
    imshow(FI);title('Original');hold on
    pause(0.5);
    drawnow
    imshow(FI_EA);title('Registration with EAT');hold on
    pause(0.5);
    drawnow
end










