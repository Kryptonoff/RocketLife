class CfgPatches
{
	class DiscordEmbedBuilder
	{
		name="DiscordEmbedBuilder";
		author="Connor";
		url="https://steamcommunity.com/id/_connor";
		requiredVersion=1.6799999;
		requiredAddons[]={};
		units[]={};
		weapons[]={};
	};
};
class CfgFunctions
{
	class DiscordEmbedBuilder
	{
		class Scripts
		{
			file="\DiscordEmbedBuilder";
			class init
			{
				preInit=1;
			};
			class buildCfg
			{
			};
			class buildSqf
			{
			};
			class send
			{
			};
		};
	};
};
class CfgDiscordEmbedWebhooks
{
	Reports="https://discord.com/api/webhooks/979118017059389511/AdMqYHb91iN5PVKkqiEog1hwdyQVqcou1P12z9FxPrsEM0sduIL5ICqKZdl8qFoOACKJ";
	test="https://discord.com/api/webhooks/866363038320164874/2dUY3ZTW6jKqgem9jn9_UwnU56ExsZBwkQr67L-2maarfyiVdVwmECHTRpFsPlH8nyTU";
	UserRegistered = "https://discord.com/api/webhooks/869315489254494248/yVyohBQaUOc5xFE2blY4qBPY1FwaUxbJTDjYIP2ja5ud3WXWNksOcaxfS2YZWmcVgjjE";
	AdminServer="https://discordapp.com/api/webhooks/550477056820117505/qaWQA-SSG67UeZYLliE2sGo_M3Z14po5zfwW9JvRT6UKdmnlJsmLrqhdeA6M7IGcI1bC";
	KillLog="https://discordapp.com/api/webhooks/550492517418926080/QPN3CjpCcdPlF1lb7Dz54uT8t5rD7uasp5UkaKmn64ebvKjfYQdStyZvV4muLAB2Ys6t";
	StripLog="https://discordapp.com/api/webhooks/550699298510209025/LGorRWAlbzTIO3-rnrPRA4wBuER4KoJrgIK2xh60HDfNCuLg2seHiq6k4ncM9F0EdE6I";
	GetInLockVeh="https://discordapp.com/api/webhooks/550700673340145680/DAEVlei0zeVjVhql21tBVZ52BHNFxEfVo1T2zYYiEA1BFyKJioxqyitQz0BC8B5sr3K6";
	SpyGlass = "https://discordapp.com/api/webhooks/550757776847274007/902c43CDqksmbqQC_6qC3Ej5KYA0dYPkbOP2GYWkuVh_UZsF2N_lYbX608AZylxFbn21";
	swapVehicle = "https://discordapp.com/api/webhooks/587788319669092371/DzrxhXPeeVIwZfEsnHvcyv2ROn5e7ubC5MdF0kw2lVzIL9313bcdGnwdSvGqNDmLkghA";
	Vars = "https://discordapp.com/api/webhooks/591608733440671754/VpedG5_Z5ACRr4hVpnv1cqDvm6bzaig4tiV5dypZDz5wp1nQYoe1k_QrNI5Y1uDxEDSi";
	BlackListItems = "https://discordapp.com/api/webhooks/595721357019316235/cGvZoQvaPH6aCRO3akvTK34wjA34PanWa1zj2DMxAQ9R_w0_xQghDASmZ1WvE0jqW9DF";
	AB = "https://discordapp.com/api/webhooks/599777803961106432/wekZ03sAYW5O3jHkzUdAD47clKds4qYojGJgJDsLZDxAgylHz-YwOc38XDxoH-XsDqQy";
	ChopBot = "https://discordapp.com/api/webhooks/643970074486636554/TrfsD2-Gj12-a747K82XpW2_SfKVuT9i4Vl40GqhIH65N89xuQtYXGA-eboxW_elFgN3";
	LotBot = "https://discord.com/api/webhooks/870087779579736095/V3HMrw54OaflSEDlcW_VaZoZAn4ZXDj55_XUdNI-B_ivOtUOywMJzocTUNzLUEO8tCS1";
	Multis = "https://discordapp.com/api/webhooks/697145618975555584/1zBtt1fYHRPhL8mg4MdtpN9Z_q3zCgzIF4GBwGQ2Nk1CC0tl6sal4kwER52SJn2etCOM";
	Warzone = "https://discordapp.com/api/webhooks/697178012566683772/YFjBp1gAqlCeIaPBREsH6S5LXtjLpSJx-3SZUAvCYzenaY6fnw5zunIq4jKFlgBzNfeF";
	procs = "https://discordapp.com/api/webhooks/731055413792866395/ntVd_6pDbn6xrcWJZKZRTQ9z4kTYSubjjchZVBWSPG-N8rRkWw9jCZImldOoQ7gw3stN";
	NewAcc = "https://discord.com/api/webhooks/779028226781216808/mZwPjBn7IvQvZNReIm7Nk6qO3qBLBQ8R3P0bfp-0G5wcr2z61BWI1myNZbMbkce4kzyS";
	VRDM = "https://discord.com/api/webhooks/828774073689571379/w2e77JHCd8_jNherAz9PEcvnmPfT_v9GlRQaM0HC4VqgRy2oKNRYj8LSdHpSzfO8-XJF";
	Confiscate = "https://discord.com/api/webhooks/831143772556623922/iCqmD90nReEcMxw76OTnKLp5FTOFcd6HY2lV_zM0Vdkn2rs1XLnhcxQAFViTDIewzuLi";
	Garages = "https://discord.com/api/webhooks/834456463107293204/wr6RyCr49uU9JKxOGhdFMHSUH2DoszGmy6atirk6cchiETn8woIQsMtaq4bGqgQ1rhxg";
	Roulette = "https://discord.com/api/webhooks/899296694217342986/KEIHIMe2ekczHJ-ENmAZM5U1oytDjOk19YHYADgNL48PQ2D7rRR0qxzDzk5CKqpMg94j";
	ConnectLog = "https://discord.com/api/webhooks/902124555349393468/kHV2tRezrpCTXtq8cyVyPFLPci5k2F989gT0hHytS04SDRlArbL7KHpA_P4Yecbp2aLj";
	Rent = "https://discord.com/api/webhooks/902185429665710100/4HAmQ2EqTZ1zID1PC9y2qte_DKH8OgFmGF3tvHOLtc9a_F9-58EEocqfV1UErRkZMWOQ";
	Prison = "https://discord.com/api/webhooks/877654742417932309/hZSA6zTf0KoU_24pf7K3N6LeEbhAD7QoBnZrwzlVj2IkexD48aV3NFXOKRapTw8E0dd7";
	Poker = "https://discord.com/api/webhooks/929388156757897256/8cgvU0-XEDTarzLAMBxl6zcjdol9-H06y4Eb3_dZboIvJtv_w7CAoLs9Oj8eyh3h3vpk";
	hotwire = "https://discord.com/api/webhooks/970380850304778351/GfYmmj95zLnVszxFsfjEG4zLFfAfW779LA84AWsGbqsALc0yYFiMtglTjODTB2hyCGUF";
	hell="https://discord.com/api/webhooks/982286491214549012/V6QpLkObHAu2YvC7DdFC5YhWC-RCa0T-cr8xkVUaBxOp7ycsa-_5OiQySLVZZ4QkLy7e";
	cases = "https://discord.com/api/webhooks/1027534055908057098/RfURRGh7Zthb9BoYuPR4hkS_MYzBmao4IbO4odOpdcwS6mRpIDcYy0dvAJDmyZ1paGic";
	SendMoney = "https://discord.com/api/webhooks/1030929731203375155/LmghByE0utwaRxuIaz0jVnvCNqXGlnRcCxwI6e5AncB9KG1DmzI87kJlkKj74Yu6XxEt";
	Economy="https://discord.com/api/webhooks/1046702397717753886/jOhaO0Lntv-YjWwYvqSIvUOlnK8uGyhkU1N9iaxFwsM8zzfUnaf-HgooZfLyI_0mxz2v";
	TRX = "https://discord.com/api/webhooks/1073912960164036648/AS9VlU5WOxQlBIOIOnco3JVuhOs9VD39hR4ZDKu0t34VSjsYPAki7qaICaW6XXUjoVfU";
	RewardLog="https://discord.com/api/webhooks/1111943661295513600/rI4eMsxYgA3W9w0Qb8QPjBbcVIY_yBHhOtLhASinSz3S4XepdyYbkxyOzE8Wu0r5TTRW";
};
class CfgDiscordEmbedTemplate
{
	title="";
	description="";
	url="";
	color="";
	timestamp=0;
	thumbnail="";
	image="";
	class Author
	{
		name="";
		url="";
		image="";
	};
	class Footer
	{
		text="";
		image="";
	};
	fields[]={};
};
class CfgDiscordEmbedBuilder
{
	class AdminServer
	{
		webhook="AdminServer";
		message="Это простой месседж";
		username="А тут имя";
		avatar="https://discordapp.com/assets/2c21aeda16de354ba5334551a883b481.png";
		tts=0;
	};
};
