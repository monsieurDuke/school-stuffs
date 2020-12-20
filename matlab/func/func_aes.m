function [r_fin_state] = func_aes(r_state,k_state,method_str)

	% // Muhammad Nur Irsyad - 1807422020 - CCITSEC5
	% // ----------------------------
	% // INVERSEABLE = SUBBYTE, SHIFTROW, ADDROUNDKEY
	% // NO INVERSE  = MIXCOLUMNS, KEYSCHEDULLER / KEYEXPANDER
	% // ----------------------------
	% // r_state = (hexadecimal round state matrix 4x4)
	% // k_state = (hexadecimal key state matrix 4x4)	
	% // method_str = (string) ['enc','dec']

	fwd_sbox = init_aesbox('fwd-sbox');
	inv_sbox = init_aesbox('inv-sbox');
	rcon     = init_aesbox('rcon');
	fwd_mcon = init_aesbox('fwd-mcon');
	inv_mcon = init_aesbox('inv-mcon');

	switch method_str
		case 'enc'
			round = 1;		
			r_addr_state = func_aes_addroundkey(r_state,k_state)
			r_keys_state = k_state;
			for i = 1:9
				r_keys_state = func_aes_keyscheduller(r_keys_state,fwd_sbox,rcon,round)
				r_subb_state = func_aes_subbyte(r_addr_state,fwd_sbox)
				r_shft_state = func_aes_shiftrows(r_subb_state,'fwd')
				r_mixc_state = func_aes_mixcolumns(r_shft_state,fwd_mcon,'fwd')
				r_addr_state = func_aes_addroundkey(r_mixc_state,r_keys_state)
				round = round + 1;
			end
			r_keys_state = func_aes_keyscheduller(r_keys_state,fwd_sbox,rcon,round)
			r_subb_state = func_aes_subbyte(r_addr_state,fwd_sbox)
			r_shft_state = func_aes_shiftrows(r_subb_state,'fwd')
			r_addr_state = func_aes_addroundkey(r_shft_state,r_keys_state)
	end
	r_fin_state = r_addr_state;

end