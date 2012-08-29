function [varargout]=hist2d(x,xp,res,clims)
%HIST2D(x,y,res,clims) Generates 2-dimensional histogram.
%	IMG = HIST2D(x,y) generates a 2-dimensional histogram
%	and returns an image array.
%
%	IMG = HIST2D(x,y,res) sets the resolution of the histogram
%	as the number of bins the histogram will have.
%
%	IMG = HIST2D(x,y,res,clims) sets the resolution as above
%	and sets the max and min of the histogram's color scale.
%	
%	[IMG,H] = HIST2D(x,y,...) returns the image handle H.
%
%	[IMG,EDGEX,EDGEY] = HIST2D(x,y,...) returns the edge arrays
%	for the x and y dimensions.

	% If resolution isn't set, default to 128 bins.
	if nargin==2
		res=128;
	end

	% If clims is set, enable their use.
	if nargin==4
		lims=true;
	else
		lims=false;
	end

	% Currently unused - specifies zoomed region.
	frac=1;

	% Finds edges of space in x, creates x bin edge grid.
	minx   = min(x);
	maxx   = max(x);
	window = maxx-minx;
	delta  = window*(1-frac)/2;
	minx   = minx+delta;
	maxx   = maxx-delta;
	delx   = (maxx-minx)/res;
	edgex  = minx:delx:maxx;
	
	% Finds edges of space in y, creates y bin edge grid.
	minxp  = min(xp);
	maxxp  = max(xp);
	window = maxxp-minxp;
	delta  = window*(1-frac)/2;
	minxp  = minxp+delta;
	maxxp  = maxxp-delta;
	delxp  = (maxxp-minxp)/res;
	edgexp = minxp:delxp:maxxp;

	% Iterates over each bin in one dimension, creating a histogram in the other.
	for i=1:res
		% Returns indices of all points within x bin
		ind=find(and(x>=minx+delx*i,x<minx+delx*(i+1)));

		% Returns histogram of current bin in xp.
		nt=histc(xp(ind),edgexp);

		% Appends histogram, building up an array
		n(i,:)=nt;
	end

	% Transposes array so that it's in the right format to display
	imgout=transpose(n);

	% Displays histogram
	if lims
		% Uses clims
		h=imagesc([min(edgex),max(edgex)],[min(edgexp),max(edgexp)],imgout,clims);
	else
		% Uses default clims
		h=imagesc([min(edgex),max(edgex)],[min(edgexp),max(edgexp)],imgout);
	end

	% Changes histogram to display with the y direction in the expected way.
	set(gca,'YDir','normal');

	% Returns requested output
	switch nargout
		case 1
			% Returns just the image
			varargout={imgout};
		case 2
			% Returns the image and handle
			varargout={imgout,h};
		case 3
			% Returns image and edge arrays
			varargout={imgout,edgex,edgexp};
			% varargout={n,edgex,edgexp};
		% case 3
		%		 varargout={imgout,[min(edgex),max(edgex)],[min(edgexp),max(edgexp)]};
		% case 4
		%		 varargout={imgout,[min(edgex),max(edgex)],[min(edgexp),max(edgexp)], h};
	end
end
