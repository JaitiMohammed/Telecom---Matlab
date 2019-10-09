function cCanal=codageanal
     cS=codageSource;
     g=[1 0 1 1];
     msgG=[codageSource zeros(1, length(g)-1)] %concataination
     [Q,R]=deconv(msgG, g); %division
     R=abs(rem(R,2))
     r=length(g)-1;
     R= R(length(R)-r+1:end);
     kl=length(codageSource);
     nbl=length(cS)/8;
     cSr=reshape(cS,nbl,8)
     for j=1: nbl
         cCanal(j:1)=[cSr(j,:) R]; %ajout de CRC
     end;
end