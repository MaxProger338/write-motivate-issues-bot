program timer;
uses
	SysUtils, DateUtils, Unix;
const
	interval: int64 = 60 * 1000;
var
	start, current: int64;
	iterationCounter: word = 0;
	pusherPath: string;
begin
	if ParamCount = 0 then
		halt(1);

	pusherPath := ParamStr(1);
	start := 0;

	while true do
	begin
		current := DateTimeToUnix(Now) * 1000 + MilliSecondOfTheSecond(Now);
		
		if current - start > interval then
		begin
			iterationCounter := iterationCounter + 1;
			writeln('Iteration number ', iterationCounter);
			if fpSystem(pusherPath + ' ' + IntToStr(iterationCounter)) <> 0 then
				halt;
			
			start := current;
		end;
	end;
end.
