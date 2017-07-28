titleText ["Cargod enabled","PLAIN DOWN"]; titleFadeOut 4;

while {alive ( vehicle player )} do 
{
	vehicle player setfuel 1;
	vehicle player setvehicleammo 1;
	vehicle player allowDamage false;
	sleep 0.001;
};
