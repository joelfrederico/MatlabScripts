function addbox(p1,p2)
	mf = gcf;
	f1 = figure('Visible','off','Position',[360,500,400,200]);
	controlpanel=uipanel('Parent',f1,'Units','Pixels','Position',[10,10,380,180]);
	leftx_t = uicontrol('Parent',controlpanel,'Style','edit','String',0,'Position',[10,140,50,30],
		'Callback',{@drawlines});
	leftx_s = uicontrol('Parent',controlpanel,'Style','slider','Value',0,'Position',[65,133,300,30],'Min',0,'Max',1,
		'Callback',{@drawlines});
	lefty_t = uicontrol('Parent',controlpanel,'Style','edit','String',0,'Position',[10,110,50,30],
		'Callback',{@drawlines});
	lefty_s = uicontrol('Parent',controlpanel,'Style','slider','Value',0,'Position',[65,103,300,30],'Min',0,'Max',1,
		'Callback',{@drawlines});
	rightx_t = uicontrol('Parent',controlpanel,'Style','edit','String',0,'Position',[10,80,50,30],
		'Callback',{@drawlines});
	rightx_s = uicontrol('Parent',controlpanel,'Style','slider','Value',0,'Position',[65,73,300,30],'Min',0,'Max',1,
		'Callback',{@drawlines});
	righty_t = uicontrol('Parent',controlpanel,'Style','edit','String',0,'Position',[10,50,50,30],
		'Callback',{@drawlines});
	righty_s = uicontrol('Parent',controlpanel,'Style','slider','Value',0,'Position',[65,43,300,30],'Min',0,'Max',1,
		'Callback',{@drawlines});
	set(f1,'Visible','on');
	function drawlines
		
end
