function [varargout]=plotyyannotate(x1,y1,x2,y2,marker,titleS,xlabelS,ylabel1S,ylabel2S)
	[ax,h1,h2]=plotyy(x1,y1,x2,y2);
	set(h1,'Marker',marker);
	set(h2,'Marker',marker);
	title(titleS);
	xlabel(xlabelS);
	set(get(ax(1),'Ylabel'),'String',ylabel1S);
	set(get(ax(2),'Ylabel'),'String',ylabel2S);
	if nargout > 0
		varargout(1)={ax};
		varargout(2)={h1};
		varargout(3)={h1};
	end
end
