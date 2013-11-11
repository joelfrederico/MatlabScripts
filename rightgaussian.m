function y=rightgaussian(pars,x)
%RIGHTGAUSSIAN Right half of a gaussian distribution for fitting.
%   Y = RIGHTGAUSSIAN(PARS,x) returns the y value for the right half of a gaussian function.
%   PARS is a vector: [Integral1, Mean1, Sigma1, Integral2, Mean2, Sigma2]
	y=pars(1)*exp(-(x-pars(2)).^2./(2*pars(3)^2));
	y=y.*(x>pars(2));
end
