function varargout=hist1d(x,res)
% HIST1D(x,res) Generates 1-dimensional histogram without displaying image.
	minx=min(x);
	maxx=max(x);
	delx=(maxx-minx);
	xcoord=minx:delx/res:maxx;
	[h,binx]=histc(x,xcoord);
	varargout={xcoord,h,binx};
end
