function [Str1, Str2, Fxy, Pxy] = SWater( d, X, Y, FileName )
m = length(X);    % rows  
n = length(Y);    % coloumns

load(FileName); 
% declaring matrices 
f = zeros(m+1,n+1); 
ptr = zeros(m+1,n+1); 

% We shall stick to the convention that 1 means coming from left, 2
% means coming from a diagonal and 3 means coming from top and 4 means its
% a new strand 
%%          Filling up matrices 

% Initializing f matrix 

for i = 1:m+1 
    f(i,1) = 0; 
end

for j = 1:n+1 
    f(1,j) = 0; 
end 

tempMag = zeros(1,4); 
s = 0; 



for i = 2:m+1 
    for j = 2:n+1 
                
        tempI = find(X(i-1)==strF); 
        tempJ = find(Y(j-1)==strF);
        
        s = matF(tempI,tempJ); 
        
        tempMag = [f(i,j-1)-d, f(i-1,j-1)+s, f(i-1,j)-d, 0];
        
        [f(i,j), ptr(i,j)] = max(tempMag);
    end
end

        
%% Trace back 

%find maximum point in matrix 
p =2; 
q =2; 
temp = f(p,q); 
i = p ;
j = q; 
 for p = 2:m+1 
    for q = 2:n+1
        if temp <= f(p,q)
        i = p; 
        j= q;
        temp = f(p,q); 
        end
    end
 end

StrX = ''; 
StrY = ''; 

score = temp

% We shall stick to the convention that 1 means coming from left, 2
% means coming from a diagonal and 3 means coming from top  

while (i>1 || j>1)

if ptr(i,j) == 1
    j = j - 1;
    if (j==0 )
        break; 
    end
    StrX = [StrX,'-']; 
    StrY = [StrY,Y(j)];
else if ptr(i,j) == 2
        j = j-1 ; 
        i = i-1;
        
        if (j==0 || i==0)
        break; 
        end
    StrX = [StrX,X(i)]; 
    StrY = [StrY,Y(j)];
    else if ptr(i,j) == 3
      i = i - 1; 
      if (i==0)
        break; 
    end
    StrX = [StrX,X(i)]; 
    StrY = [StrY,'-'];
          else if ptr(i,j) == 4
            break; 
        end
    end
            
    end
end
end

%  This command reverses strings 

StrX = fliplr(StrX); 
StrY = fliplr(StrY); 

%display the strings 
display(StrX); 
display(StrY); 
        
%return the f and ptr matrix 
Fxy = f; 
Pxy = ptr; 
Str1 = StrX; 
Str2 = StrY; 
