x = union (findstr(s, 'TAA'), findstr(s, 'TAG'));
x = union(x, findstr(s, 'TGA'));

x1 = x(rem(x,3) == 1); x1 = union(1, x1); x1 = union(x1, length(s));
x2 = x(rem(x,3) == 2); x2 = union(2, x2); x2 = union(x2, length(s));
x3 = x(rem(x,3) == 0); x3 = union(3, x3); x3 = union(x3, length(s));

[a(1) b(1)] = max(diff(x1));
[a(2) b(2)] = max(diff(x2));
[a(3) b(3)] = max(diff(x3));

[m I] = max(a)

if I == 1 
    t = x1;
end
if I == 2
    t = x2;
end
if I == 3
    t = x3;
end

orfmax = s(t(b(I))+3:t(b(I))+m-1)

% Notes:
% m is the length of the maximum ORF found
%
% I is the reading frame index of the maximum ORF, it is 1, 2, or 3
%
% The largest ORF starts following the "stop codon" starting from t(b(I))