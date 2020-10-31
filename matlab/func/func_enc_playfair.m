function [cipher_return] = func_enc_playfair(plain_str)
    % A : 65 -- 90
    % a : 97 -- 122
    key_arr = ['L','G','D','B','A';'Q','M','H','E','C';'U','R','N','I','F';'X','V','S','O','K';'Z','Y','W','T','P'];
    to_ascii = double(plain_str);
    [x,y] = size(to_ascii);
    z = x;
    cipher_return = '';
    brd = 2;
    inc = 0;
    for indx = x:y
        if inc == brd
            brd = brd + 2;
            cipher_return = strcat(cipher_return,{' '});            
        end
        inc = inc + 1;
        cipher_return = strcat(cipher_return,char(to_ascii(indx))); 
        if indx < y
            if char(to_ascii(indx)) == char(to_ascii(indx+1))
                inc = inc + 1;
                cipher_return = strcat(cipher_return,'x');
            end
        end
    end
    cipher_return = char(cipher_return);
end