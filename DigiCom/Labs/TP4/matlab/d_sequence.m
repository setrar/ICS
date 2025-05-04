M = [4294967295,   1269147955,   2106658394,   1831220124,   1908917216,   2114976768,   1931316836, 1799681456,   2109872364,   1302443846,   1123090431];

for C=0:2047, % C is in the input c-sequence, C=[c0 c1 c2 ... c(K-1)]
  D=mod(C,2)*M(1); % D is the d-sequence, D=[d0 d1 d2 ... d31];
  for n=2:11,
    ex = 2^(1-n)
    p = C*ex
    fl = floor(p)
    md1 = mod(fl,2)
    md2 = md1*M(n)
    D = bitxor(D,md2);
  end
end

display(D)