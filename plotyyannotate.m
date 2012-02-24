function [varargout]=plotyyannotate(x1,y1,x2,y2,marker,titleS,xlabelS,ylabel1S,ylabel2S)
	[ax,h1,h2]=plotyy(x1,y1,x2,y2);
	set(h1,'Marker',marker);
	set(h2,'Marker',marker);
	set(h2,'LineStyle','--');
	title(titleS);
	xlabel(xlabelS);
	set(get(ax(1),'Ylabel'),'String',ylabel1S);
	set(get(ax(2),'Ylabel'),'String',ylabel2S);
	ylimit(1,:) = ylim(ax(1));
	ylimit(2,:) = ylim(ax(2));
	ymin = min(ylimit(:,1));
	ymax = max(ylimit(:,2));
	ylimnew=[ymin ymax];
	ylim(ax(1),ylimnew);
	ylim(ax(2),ylimnew);
	if nargout > 0
		varargout(1)={ax};
		varargout(2)={h1};
		varargout(3)={h1};
	end
end
