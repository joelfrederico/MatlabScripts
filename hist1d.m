function varargout=hist1d(x,res)
	minx=min(x);
	maxx=max(x);
	delx=(maxx-minx);
	xcoord=minx:delx/res:maxx;
	[h,binx]=histc(x,xcoord);
	varargout={xcoord,h,binx};
end
