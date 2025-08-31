
#define TEXT "<br/><t valign='middle' align='center' size='3.9'><img image='%2'></img></t><br/><br/><t size='1' shadow='1' align='center' font='%3'>%1</t>"
#define TIME_TEXT "<t font='SFCompactText' align='left'> \
<t align='right'><img image='%7'></img></t> \
<t size='1.8'>%1"+ (if (_second % 2 == 0) then {":"}else{" "}) + "%2</t><br/> \
<t size='1'>%5, %3 %4</t><br/> \
<t size='1'>%6</t> \
</t>"
#define STATUS_TEXT "<t font='SFCompactText' size='.8'><t align='left'>%1</t><t align='right'>%2</t></t>"