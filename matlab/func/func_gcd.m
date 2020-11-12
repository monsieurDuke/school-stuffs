function [return_gcd] = func_gcd(in1,in2)

	% // loop thru each len of array
	[idx_r,idx_c] = size(in1);
	turn_mtx = 0;
	for idx_1 = 1:idx_r
		for idx_2 = 1:idx_c
			arg1 = in1(idx_1,idx_2);
			arg2 = in2;
			% // GCD (Greatest Common Divisor)
			% // Loop thru each args, divide em if only mod = 0	
			return_gcd = 0;	
			get_arg1 = arg1;
			get_arg2 = arg2;
			catch_div = 0;	

			% // in the searching of arg1's divisor
			inc_div = 2;
			inc_idx = 1;	
			while true
				if get_arg1 == 1
					break
				end
				if mod(get_arg1,inc_div) == 0
					get_arg1 = get_arg1 / inc_div;
					catch_div(1,inc_idx) = inc_div;
					inc_idx = inc_idx + 1;
					continue
				end
				inc_div = inc_div + 1;
			end

			% // in the searching of arg2's divisor
			inc_div = 2;
			inc_idx = 1;	
			while true
				if get_arg2 == 1
					break
				end
				if mod(get_arg2,inc_div) == 0
					get_arg2 = get_arg2 / inc_div;
					catch_div(2,inc_idx) = inc_div;
					inc_idx = inc_idx + 1;
					continue
				end
				inc_div = inc_div + 1;
			end

			% // find the gcd from the those two
			row_1 = catch_div(1,:);
			row_2 = catch_div(2,:);
			catch_same_div = intersect(row_1,row_2);
			catch_multi = 1;
			inc_multi = 2;
			[x,y] = size(catch_same_div);
			for idx = x:y
				catch_multi = catch_multi * catch_same_div(x,idx);
			end
			next_multi = catch_multi;
			while (next_multi <= arg1) || (next_multi <= arg2)
				if (rem(arg1,next_multi) == 0) && (rem(arg2,next_multi) == 0)
					catch_multi = next_multi;
					inc_multi = 1;
				end
				inc_multi = inc_multi + 1;
				next_multi = catch_multi * inc_multi;
			end
			turn_mtx(idx_1,idx_2) = catch_multi;
			return_gcd = turn_mtx;

			% // extending euclidian
			% // fpb = sa + tb
			% // 5 = 15s + 20t
			% // 20t = 5 - 15s
			% // t = 5 - 15s/20
			% // 5 = 15s + (5-15s)
			% // 5 - 
		end
	end
end