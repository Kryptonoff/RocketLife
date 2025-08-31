/*
Author:	Arrra

http://steamcommunity.com/id/sdfsfsdgdfgdgdfg/

My VK:https://vk.com/id478482025
*/
detach port_box;
private _pos = (vehicle player) modelToWorld [0,1.5,0];
port_box setPosATL [_pos select 0, _pos select 1, 0];
addAct_box = port_box addAction ["взять в руки коробку",SmartClient_jobs_boxPickUp,nil,0,false,true,"",' box_work_port_active '];
//player removeAction addAct_box;
player removeAction addAct_box;


