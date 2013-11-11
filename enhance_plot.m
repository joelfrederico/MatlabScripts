function enhance_plot(fontname,fontsize,linewid,markersiz)

%  enhance_plot([fontname,fontsize]);
%
%  Function to enhance MATLAB's lousy text choices on plots.  Sets the
%  current figure's Xlabel, Ylabel, Title, and all Text on plots, plus
%  the axes-labels to the "fontname" and "fontsize" input here where
%  the defaults have been set to 'times' and 16.
%  Also sets all plotted lines to "linewid" and all markers to size
%  "markersiz".  The defaults are 2 and 8.
%
%  INPUTS:  fontname:   (Optional,DEF='TIMES') FontName string to use
%                       MATLAB's ugly default is 'Helvetica'
%           fontsize:   (Optional,DEF=16) FontSize integer to use
%                       MATLAB's tiny default is 10
%           linewid:    (Optional,DEF=2) LineWidth integer to use
%                       MATLAB's skinny default is 0.5
%           markersiz:  (Optional,DEF=8) MarkerSize integer to use
%                       MATLAB's squinty default is 6
%  for all inputs, if pass 0, use default
%
% Modifications
%  19-Feb-2002 J. Nelson
%       added linewid and markersiz to help squinting readers
%
%  20-Feb-2002 J. Nelson
%       added check for legend.  If legend exists, increase the 
%           line and marker size, also increase the font to 
%           fontsize-2 (2 points smaller than title and labels)
%======================================================================

if (~exist('fontname')|(fontname==0))
  fontname = 'times';
%     fontname = 'helvetica';
end
if (~exist('fontsize')|(fontsize==0))
%   fontsize = 16;
  fontsize = 14;
end
if (~exist('linewid')|(linewid==0))
  linewid=2;
end
if (~exist('markersiz')|(markersiz==0))
  markersiz = 8;
end

Hf=gcf;
%Ha=gca;
HfChild=get(Hf,'Children');
axesb=strcmp(get(HfChild,'Type'),'axes');
temp = [];
for i=1:length(axesb)
	if axesb(i)
		temp = [temp, HfChild(i)];
	end
end
HaArray=temp;
for i=1:length(HaArray)
	Ha=HaArray(i);
	Hx=get(Ha,'XLabel');
	Hy=get(Ha,'YLabel');
	Ht=get(Ha,'Title');
	set(Ha,'LineWidth',.75);
	set(Hx,'fontname',fontname);
	set(Hx,'fontsize',fontsize);
	set(Hy,'fontname',fontname);
	set(Hy,'fontsize',fontsize);
	set(Ha,'fontname',fontname);
	set(Ha,'fontsize',fontsize);
	%set(Ha,'YaxisLocation','right')
	%set(Ha,'YaxisLocation','left')
	set(Ht,'fontname',fontname);
	set(Ht,'fontsize',fontsize+4);
	set(Ht,'fontweight','bold');
	set(Hy,'VerticalAlignment','bottom');
	set(Hx,'VerticalAlignment','cap');
	set(Ht,'VerticalAlignment','baseline');
	Hn = get(Ha,'Children');
	n = length(Hn);
	if n > 0
	  typ = get(Hn,'Type');
	  for j = 1:n
	    if strcmp('text',typ(j,:))
	      set(Hn(j),'fontname',fontname);
	      set(Hn(j),'fontsize',fontsize);
	    end
	    if strcmp('line',typ(j,:))
	      set(Hn(j),'LineWidth',linewid);
	      set(Hn(j),'MarkerSize',markersiz);
	    end
	  end
	end
	legh=legend;
	Hn=get(legh,'Children');
	n = length(Hn);
	if n > 0
	  typ = get(Hn,'Type');
	  for j = 1:n
	    if strcmp('text',typ(j,:))
	      set(Hn(j),'fontname',fontname);
	      set(Hn(j),'fontsize',fontsize-2);
	    end
	    if strcmp('line',typ(j,:))
	      set(Hn(j),'LineWidth',linewid);
	      set(Hn(j),'MarkerSize',markersiz);
	    end
	  end
	end
	if length(HaArray)==2 && i==1
		pos=get(Ha,'Position');
		set(Ha,'Position',[pos(1), 0.15, pos(3), 0.75]);
		pos=get(Hf,'Position');
		posy=get(Hy,'Position');
		Xlim=get(Ha,'Xlim');
		(Xlim(2)-Xlim(1))/(.75*pos(3));
		set(Hy,'Position',[Xlim(2)+35*(Xlim(2)-Xlim(1))/(.75*pos(3)), posy(2), posy(3)]);
	end
end
figure(Hf);
