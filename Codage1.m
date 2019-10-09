function src=codageSource
    msg='ABC';
    msg_ascii=double(msg);
    msg_bin=dec2bin(msg_ascii,8);
    [l,c]=size(msg_bin);
    msg_bin=reshape(msg_bin',1,l*c);
    src=str2num(msg_bin);
    disp(src)
end
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
     disp(cCanal)
end
function cLigne=codageEnligne
    cLigne=2*codageCanal-1;
    %[l,c]=size(cE);
    %cLigne= reshape(cE, 1, l*c);
    disp(cLigne)
end
function train=transmission
train=codageEnligne
disp(train)
end