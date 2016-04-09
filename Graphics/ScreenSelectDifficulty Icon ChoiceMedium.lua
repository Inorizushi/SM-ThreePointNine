local gc = Var("GameCommand");
local ind = gc:GetIndex();
local delay = ind / 10;

local path = "_screenselectdifficulty icons/";
return Def.ActorFrame {
	InitCommand=cmd(zoom,0);
	OnCommand=cmd(queuecommand,"In");
	InCommand=cmd(sleep,delay;zoom,1;addx,-SCREEN_CENTER_X;bounceend,0.35;addx,SCREEN_CENTER_X);
	OffCommand=cmd(stoptweening;sleep,delay;bouncebegin,0.25;addx,-SCREEN_CENTER_X;runcommandsonleaves,cmd(stoptweening;sleep,0.15;linear,0.25;diffusealpha,0));
	LoadActor( path .. "info medium" )..{
		InitCommand=cmd(y,-108;vertalign,bottom);
	};
	LoadActor( path .. "picture medium" )..{
		InitCommand=cmd(y,-108;valign,0);
		OnCommand=cmd(zoomy,0.0;sleep,0.8;bounceend,0.3;zoomy,1);
		OffCommand=cmd(sleep,0.4;bouncebegin,0.3;zoomy,0);
	};
}