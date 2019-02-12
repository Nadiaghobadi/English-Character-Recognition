X=zeros(1,64);
Z=zeros(1,21);
Y=zeros(1,7);
delta_k=zeros(1,7);
delta_j=zeros(1,21);
W_x_z=rand(64,21);      %marhale0
W_z_y=rand(21,7);       %marhale0
t=zeros(1,7);
%tedade nerone makhfi=21
t_a=[1 -1 -1 -1 -1 -1 -1];
t_b=[-1 1 -1  -1 -1 -1 -1];
t_c=[-1 -1 1  -1 -1 -1 -1];
t_d=[-1 -1 -1 1 -1 -1 -1];
t_e=[-1 -1 -1 -1 1 -1 -1];
t_j=[-1 -1 -1 -1 -1 1 -1];
t_k=[-1 -1 -1 -1 -1 -1 1];

alpha=0.5;
str = ['A1.txt'; 'A2.txt';'A3.txt';'B1.txt';'B2.txt';'B3.txt';'C1.txt';'C2.txt';'C3.txt';'D1.txt';'D2.txt';'D3.txt';'E1.txt';'E2.txt';'E3.txt';'J1.txt';'J2.txt';'J3.txt';'K1.txt';'K2.txt';'K3.txt'];
for epoc=1:30
for f=1:21
help=zeros(1,64);
file=fopen(str(f,1:6));
matrix=fscanf(file,'%s');
s=(length(matrix));
for i=1:s
   % display(a1(i));
    if matrix(i)=='.'
        help(i)=-1;
    else if matrix(i)=='#'
        help(i)=1;
        end 
    end
end
help(64)=1;
X=help;
if(f==1||f==2||f==3)
    t=t_a;
end
if(f==4||f==5||f==6)
    t=t_b;
end
if(f==7||f==8||f==9)
    t=t_c;
end
if(f==10||f==11||f==12)
    t=t_d;
end
if(f==13||f==14||f==15)
    t=t_e;
end
if(f==16||f==17||f==18)
    t=t_j;
end
if(f==19||f==20||f==21)
    t=t_k;
end
fclose(file);
%sigmoid: y=sigmf(x);
%pishkhor
z_in=X*W_x_z;
for i=1:21
    Z(i)=sigmf(z_in(i),[1 0]);
end

y_in=Z*W_z_y;
for i=1:7
    Y(i)=sigmf(y_in(i),[1 0]);
end
%end_pishkhor

%paskhor
for i=1:7       %delta_k=(tk-yk)f'(y_ink);
    delta_k(i)=(t(i)-Y(i))*sigmf(y_in(i),[1 0])*(1-sigmf(y_in(i),[1 0]));
end
delta_w=alpha*Z'*delta_k;
delta_in_j=delta_k*W_z_y';
for i=1:21
delta_j(i)=delta_in_j(i)*sigmf(z_in(i),[1 0])*(1-sigmf(z_in(i),[1 0]));
end
delta_v=alpha*X'*delta_j;
%endpaskhor
%update
W_x_z = W_x_z+delta_v;
W_z_y = W_z_y+delta_w;

%endupdate
end
end

%test
file_test=fopen('A1.txt');
help_test=zeros(1,64);
matrix=fscanf(file_test,'%s');
s=(length(matrix));
for i=1:s
    if matrix(i)=='.'
        help_test(i)=-1;
    else if matrix(i)=='#'
        help_test(i)=1;
    else if matrix(i)=='@'
            help_test(i)=0;
        end
        end
    end
end
z_in=help_test*W_x_z;
for i=1:21
    Z(i)=sigmf(z_in(i),[1 0]);
end

y_in=Z*W_z_y;
for i=1:7
    Y(i)=sigmf(y_in(i),[1 0]);
end
display(Y);
%endtest