%X = 21*64
%.=-1   #=1;
X=zeros(1,64);
W=zeros(64,7);
t=zeros(1,7);
t_a=[1 -1 -1 -1 -1 -1 -1];
t_b=[-1 1 -1  -1 -1 -1 -1];
t_c=[-1 -1 1  -1 -1 -1 -1];
t_d=[-1 -1 -1 1 -1 -1 -1];
t_e=[-1 -1 -1 -1 1 -1 -1];
t_j=[-1 -1 -1 -1 -1 1 -1];
t_k=[-1 -1 -1 -1 -1 -1 1];

str = ['A1.txt'; 'A2.txt';'A3.txt';'B1.txt';'B2.txt';'B3.txt';'C1.txt';'C2.txt';'C3.txt';'D1.txt';'D2.txt';'D3.txt';'E1.txt';'E2.txt';'E3.txt';'J1.txt';'J2.txt';'J3.txt';'K1.txt';'K2.txt';'K3.txt'];
for f=1:21
help=zeros(1,64);
%display(str(f,1:6));
file=fopen(str(f,1:6));
matrix=fscanf(file,'%s');
%display(matrix);
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
%display(t);
%display(help);
fclose(file);
for x=1:64
W(x,1:7)=W(x,1:7)+X(1,x)*t;
end
end
display(W);
%baraye test inja esme file test ra vared konid

file_test=fopen('A1.txt');
help_test=zeros(1,64);
matrix=fscanf(file_test,'%s');
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
answer=zeros(1,7);
for i=1:7
answer(i)=help_test*W(1:64,i);
end
%display(help_test);
%display(answer);
min=-999999;
for i=1:7
    if answer(i)>min
        min=answer(i);
        a=i;
    end
end
y=zeros(1,7)-1;
y(a)=1;
display(y);
fclose(file_test);
answ='';
if y(1)==1
    answ='A';
else if y(2)==1
        answ='B';
    else if y(3)==1
            answ='C';
        else if y(4)==1
                answ='D';
            else if y(5)==1
                    ens='E';
                else if y(6)==1
                        answ ='J';
                    else if y(7)==1
                            answ = 'K';
                        end
                    end
                end
            end
        end
    end
end
   display(answ); 