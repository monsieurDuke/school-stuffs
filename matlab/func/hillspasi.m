function hillspasi(x,k)
[r,c]=size(k);
if r~=c                                         %jika jumlah baris tidak sama dengan jumlah kolom
    disp('Kunci harus matrik bujur sangkar')    
else
    data=upper(x);
    if ismember(' ',data)==1                    %cek inputan mengandung spasi
        spasi=find(data==' ');
        km=size(spasi,2);
    else
        spasi=0;
    end;
    n=size(data,2);
    xx=[];
    a=0;
    for i=1:n                                   %menghilangkan spasi pada input jika ada
        if data(i)~=' '
            a=a+1;
            xx=[xx data(i)];
        end;
    end;
    s=mod(a,r);
    if s~=0
       ss=r-s;
       sss=[];
       for i=1:ss
           sss=[sss 'X' ];
       end;
       xx=[xx sss];
       a=a+ss;
    else
        ss=0;
    end;
    i=1;
    h=[];
    while i<=a
        m=[];
        for j=i:(i-1+r)
            m=[m xx(j)];
        end;
        m=double(m)-65;
        c=mod(k*m',26);
        c=(c+65)';
        h=[h char(c)];
        i=i+r;
    end;
    if spasi~=0
        hx=[];j=1;kk=0;
        sj=spasi(j);
        for i=1:n+ss
            if i==sj
                hx=[hx ' '];
                j=j+1;
                if j<=km
                    sj=spasi(j);
                end;
            else
                kk=kk+1;
                if kk<=a
                    d=h(kk);
                    hx=[hx d];
                end;
            end;
        end;
    else
        hx=h;
    end;
    hh=[];
    for i=1:n
        hh=[hh hx(i)];
    end;
    disp('CIPHER : ')
    disp('~~~~~~~~')
    disp(hx)
    if ~isequal(hx,hh)
        disp(' ')
        disp('CIPHER DENGAN MENGHILANGKAN KARAKTER TAMBAHAN :')
        disp('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
        disp(hh)
    end;
end;