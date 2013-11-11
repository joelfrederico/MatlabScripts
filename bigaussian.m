function y = bigaussian(pars,x)
%BIGAUSSIAN Bigaussian distribution for fitting.
%   Y = BIGAUSSIAN(PARS,x) returns the y value for a bigaussian function.
%   PARS is a vector: [Integral1, Mean1, Sigma1, Integral2, Mean2, Sigma2]
	y=(pars(1)/(pars(3)*sqrt(2*pi)))*exp(-(x-pars(2)).^2/(2*pars(3)^2))+(pars(4)/(pars(6)*sqrt(2*pi)))*exp(-(x-pars(5)).^2/(2*pars(6)^2));
end
