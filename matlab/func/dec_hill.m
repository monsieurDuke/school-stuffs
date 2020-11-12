function dec_hill(x,k)
[r,c]=size(k);
if r~=c
    disp('Kunci harus matrik bujur sangkar')
else
    y1=det(k);
    y2=mulinv(y1,26);
    if mod(y1*y2,26)~=1
        disp ('matrik tidak dapat dijadikan kunci')
    else
        data=upper(x);
        if ismember(' ',data)==1
            spasi=find(data==' ');
            km=size(spasi,2);
        else
            spasi=0;
        end;
        n=size(data,2);
        xx=[];
        a=0;
        for i=1:n
            if data(i)~=' '
                a=a+1;
                xx=[xx data(i)];
            end;
        end;
        s=mod(a,r);
        if s~=0
            ss=r-s;
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
            ki=adj(k);
            kinv=y2*ki;
            c=mod(kinv*m',26);
            c=(c+65)';
            h=[h char(c)];
            i=i+r;
        end;
        hx=[];j=1;kk=0;
        if spasi~=0
            sj=spasi(j);
            for i=1:n
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
        hh=hx;
        m=size(hh,2);
        while hh(m)=='X'
            hh(:,m)=[];
            m=m-1;
        end;
        disp('PLAINTEXT : ')
        disp('~~~~~~~~~~~~')
        disp(hx)
        if ~isequal (hx,hh)
            disp(' ')
            disp('PLAINTEXT DENGAN MENGHILANGKAN KARAKTER TAMBAHAN : ')
            disp('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
            disp(hh)
        end;
    end;
end;
disp('PLAINTEXT : ')
disp('~~~~~~~~~~~~')
disp(hx)
if ~isequal(hx,hh)
    disp(' ')
    disp('PLAINTEXT DENGAN MENGHILANGKAN KARAKTER TAMBAHAN : ')
    disp('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
    disp(hh)
end;
