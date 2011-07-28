function [varargout]=hist2d(x,xp,res)
	if nargin==2
		res=128;
	end
	%isstr(res);
	%display(res)
	%Parameters for X phase space
	%frac=.25;
	frac=1;

	minx   = min(x);
	maxx   = max(x);
	window = maxx-minx;
	delta  = window*(1-frac)/2;
	minx   = minx+delta;
	maxx   = maxx-delta;
	delx   = (maxx-minx)/res;
	edgex  = minx:delx:maxx;
	
	minxp  = min(xp);
	maxxp  = max(xp);
	window = maxxp-minxp;
	delta  = window*(1-frac)/2;
	minxp  = minxp+delta;
	maxxp  = maxxp-delta;
	delxp  = (maxxp-minxp)/res;
	edgexp = minxp:delxp:maxxp;

	% cpp =3.2439*10^-14;
	% area=delx*delxp;
	% factor=cpp/area;
	
	for i=1:res
		ind=find(and(x>=minx+delx*i,x<minx+delx*(i+1)));
		nt=histc(xp(ind),edgexp);
		n(i,:)=nt;
	end
	%display(n);
	imgout=transpose(n);
	h=imagesc([min(edgex),max(edgex)],[min(edgexp),max(edgexp)],imgout)
	set(gca,'YDir','normal');
	switch nargout
		case 1
			varargout={imgout};
		case 2
			varargout={imgout,h};
		case 3
			varargout={imgout,[min(edgex),max(edgex)],[min(edgexp),max(edgexp)]};
		case 4
			varargout={imgout,[min(edgex),max(edgex)],[min(edgexp),max(edgexp)], h};
	end
end
