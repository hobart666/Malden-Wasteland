/*while {TRUE} do 
	{
		waitUntil {cameraView == "EXTERNAL" || cameraView == "GROUP"};
		if (((vehicle player) == player) && (currentWeapon player != '')) then 
			{
				player switchCamera "INTERNAL";			 
			};
		sleep 0.5;
	};*/

while {TRUE} do 
{
    waitUntil {cameraView == "EXTERNAL" || cameraView == "GROUP"};
    if (((vehicle player) == player) && (currentWeapon player != '')) then
    {
        player switchCamera "INTERNAL";
		player globalChat "Sorry, Holster your weapon to use 3rd person view";
    }
    else
    {
        if (player != driver (vehicle player)) then 
        {
            player switchCamera "INTERNAL";
			player globalChat "Sorry, Only drivers and pilots can use 3rd person view";
        };
    };
    sleep 0.1;
};
 