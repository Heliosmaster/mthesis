function [p,q,r,c]=sbd2opt(I)

%initial canonical SBD form
[p,q,r,c] = sbdopt(I);
[P1,P2,P3,P4,P5,P6,P7] = split_subparts(I,p,q,r,c);

%getting the dimension of the subparts
m1 = size(P1,1);
n1 = size(P1,2);
m2 = size(P4,1);
n2 = size(P4,2);
m3 = size(P7,1);
n3 = size(P7,2);

% vectors that track whether a line/column is empty or not
nz2 = zeros(m1,1);
nz3 = zeros(n1,1);
nz5 = zeros(n3,1);
nz6 = zeros(m3,1);

[i2,~,~] = find(P2);

for k=1:nnz(P2)
    nz2(i2(k)) = 1;
end

[~,j3,~] = find(P3);
for k=1:nnz(P3);
    nz3(j3(k)) = 1;
end

[i6,~,~] = find(P6);

for k=1:nnz(P6)
    nz6(i6(k)) = 1;
end

[~,j5,~] = find(P5);
for k=1:nnz(P5);
    nz5(j5(k)) = 1;
end


% sorting block 2 and 3 for the upper left corner (block 1)
[zp2,p2] = sort(nz2);
[zp3,p3] = sort(nz3);

% sorting in reverse block 5 and 6 for the lower right corner (block 7)
[zp5,p5] = sort(nz5,'descend');
[zp6,p6] = sort(nz6,'descend');


% permutation vectors: the central part is the identity permutation
% because they don't get sorted in that dimension
p1 = [p2; (m1+1:m1+m2)'; m1+m2+p6];
q1 = [p3; (n1+1:n1+n2)'; n1+n2+p5];

p=p(p1);
q=q(q1);

% bookkeeping of the sizes of the new subparts
r(1) = 1;
r(2) = length(find(zp2==0))+r(1);
r(3) = length(find(zp2==1))+r(2);
r(4) = m2+r(3);
r(5) = length(find(zp6==1))+r(4);
r(6) = length(find(zp6==0))+r(5);

c(1) = 1;
c(2) = length(find(zp3==0))+c(1);
c(3) = length(find(zp3==1))+c(2);
c(4) = n2+c(3);
c(5) = length(find(zp5==1))+c(4);
c(6) = length(find(zp5==0))+c(5);
end


