function src=codageSource
    msg='ABC';
    msg_ascii=double(msg);
    msg_bin=dec2bin(msg_ascii,8);
    [l,c]=size(msg_bin);
    msg_bin=reshape(msg_bin',1,l*c);
    src=str2num(msg_bin);
end