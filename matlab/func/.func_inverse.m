function [set_inverse] = func_inverse(set_inverse)
    %------%
    in_mtx  = input('set matrix  : ');
    in_mod  = input('set modulus : ');
    get_det = round(mod(det(in_mtx),in_mod));
    if get_det ~= 0
        [get_gcd,s,t] = gcd(get_det,in_mod);
        get_inv = mod(round(inv(in_mtx)*det(in_mtx)*s),in_mod);
        [get_r,get_c] = size(in_mtx);
        %------%
        fprintf('\n-- matrix dengan ukuran %d x %d\n',get_r,get_c);
        disp(in_mtx);
        fprintf('-- r1 = %d\n-- s1 = %d\n-- t1 = %d\n\n',get_gcd,s,t);    
        fprintf('-- matrix invers | det = %d, mod = %d\n',get_det,in_mod);
        disp(get_inv);
    else
        disp('ini det 0');
    end
end