function [cipher_return] = func_enc_affine(plain_str,n_multi,n_shift)
    % A : 65 -- 90
    % a : 97 -- 122
    inv_multi = [27,53,79,105,131,157];
    [a,b] = size(inv_multi);
    for i = a:b
        r = rem(inv_multi(i),n_multi);
        if r == 0
            break
        end
    end    
    if r == 0
        to_ascii = double(plain_str);
        [x,y] = size(to_ascii);
        cipher_return = '';
        for indx = x:y
            to_multi = mod((n_multi*(to_ascii(indx)-97)),26)+65+n_shift;
            to_chars = char(to_multi);
            if plain_str(indx) ~= ' '
                cipher_return = strcat(cipher_return,to_chars);
            else
                cipher_return = strcat(cipher_return,{' '});            
            end
        end
        cipher_return = char(cipher_return);
    else
        fprintf('%d bukan bilangan prima',n_multi);
        cipher_return = NaN;
    end
end