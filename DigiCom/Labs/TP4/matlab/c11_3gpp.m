  for C=0:2047,
      idx=0;
      for symb=0:13,
        for re=0:11,
          if (symb==3 | symb==10)
             C11_3gpp(1+C,1+(symb*12)+(0:11)) = ones(1,12); 
             C11_3gpp_QPSK(1+C,1+(symb*12)+(0:11)) = ones(1,12); 
             symb=symb+1;
          end
    %      fprintf("symb %d,re %d\n",symb,re);
          C11_3gpp(1+C,1+(symb*12)+re) = cw(1+rem(idx,32)); % rate-matching of the cw-sequence
          C11_3gpp_QPSK(1+C,1+(symb*12)+re) = cw_QPSK(1+rem(idx,16)); % rate-matching of the cw-sequence
          idx=idx+1;
        end
      end
  end