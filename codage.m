function codage()
    %codage source
    msg='ABC'
    msg_a=double(msg)
    msg_b=dec2bin(msg_a,8)
    [L,c]=size(msg_b)
    msg_b=reshape((msg_b)',1,L*c)
    x=str2num(msg_b')'
    %codage canal
    g=[1 0 1 1]
    msg_g=[x zeros(1,length(g)-1)]
    [Q R]=deconv(msg_g,g)
    r=length(g)-1
    R=abs(rem(R,2))
    mat_emis3=reshape(x',8,r)'
    R=R(length(R)-r+1:end)
    for j=1:3
        C(j,:)=[mat_emis3(j,:) R];
    end
    %transmission et codage En ligne
    for n=1:11
      for i=1:3
          y(i,n)=[2*C(i,n)-1];
      end
    end
    y=reshape(y,1,33);
    disp(y);
    
    %decodage 
    
    
end 