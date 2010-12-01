% Rounds the value to the nearest increment,
% needs a valid value to determine the shift.
% Consider you want to round to the nearest
% 5, but shifted by 1, as in round to:
% ..., -9, -4, 1, 6, 11, 16, ...
% Then you need to remove the shift, mod,
% and then reintroduce the shift.
% Note, you can use the shift instead of
% valid_val, as well!
function f=roundnearest(value,interval,valid_val)
	% This shift is the same for *any* valid value.
	shift = mod(valid_val,interval);
	
	% Now mod, removing the shift from the value.
	modval = mod(value-shift,interval);
	
	% Then round and simultaneously reintroduce the shift
	% This is really:
	% f = (value-shift) - modval + shift
	% 	= value-modval
	% OR
	% f = (value-shift) + interval - modval + shift
	%   = value + interval - modval
	if modval < interval/2
		f = value - modval;
	else
		f = value + interval - modval;
	end
end