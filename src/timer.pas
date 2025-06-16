program timer;
uses
	SysUtils, DateUtils, Unix, crt;
const
	interval: int64 = 1 * 1000;
	filepath: string = 'tmp.txt';
var
	start, current: int64;
	iterationCounter: word = 0;
	pusherPath: string;
	myFile: text;
begin
	if ParamCount = 0 then
		halt(1);

	pusherPath := ParamStr(1);
	start := 0;

	{ file }
	assign(myFile, filepath);
	reset(myFile);
	readln(myFile, iterationCounter);

	while not KeyPressed do
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

	close(myFile);
	rewrite(myFile);
	writeln(myFile, iterationCounter);
	close(myFile);
end.
