function [p,q,r,c,A1,A2]=sbd(I)

    [m,n] = size(I);
    
    % separating the green and red part
    [i1,j1,v1] = find(I==1);
    [i2,j2,v2] = find(I==2);
    
    % initialization of the permutation vectors
    p0 = zeros(m,1);
    q0 = zeros(n,1);
    
    %i1 = sort(i1);
    %i2 = sort(i2);
    %j1 = sort(j1);
    %j2 = sort(j2);

    % marking of the cut rows and columns (p0 and q0)
    % 1: red row/column
    % 2: cut row/column
    % 3: green row/column
    % TODO: speed up find statements
    for i=1:m
        if find(i1==i);
            if find(i2==i)
                p0(i) = 2;
            else
                p0(i) = 1; 
            end
        else
            p0(i) = 3; 
        end
    end

    for i=1:n
        if find(j1==i);
            if find(j2==i)
                q0(i) = 2;
            else
                q0(i) = 1;
            end
        else
            q0(i) = 3;
        end
    end

    % actual sorting of permutation vectors: 1 < 2 < 3 (red, cut, green)
    % zp and zq are stored to compute the size of the parts
    [zp,p] = sort(p0);
    [zq,q] = sort(q0);

    % row borders of blocks
    r(1) = 1;
    r(2) = length(find(zp==1))+r(1);
    r(3) = length(find(zp==2))+r(2);
    r(4) = length(find(zp==3))+r(3);

    % column borders of blocks
    c(1) = 1;
    c(2) = length(find(zq==1))+c(1);
    c(3) = length(find(zq==2))+c(2);
    c(4) = length(find(zq==3))+c(3);
    
    if nargout > 4
        % explicit creation of two parts
        A1 = sparse(i1,j1,v1,m,n);
        A2 = sparse(i2,j2,v2,m,n);
    end
end
