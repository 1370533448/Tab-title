#pragma semicolon 1
#include <sourcemod>
#include <sdktools>
#include <cstrike>

native KOD_UseTag(int iClient);

public void OnPluginStart()
{
	HookEvent( "player_spawn", SpawnEvent );
	HookEvent( "player_team", SpawnEvent );
}

public Action SpawnEvent( Handle event, const char[] name, bool dontBroadcast )
{
	int	client_id	= GetEventInt( event, "userid" );
	int	client		= GetClientOfUserId( client_id );

	if(!IsClientInGame(client) || IsFakeClient(client) || KOD_UseTag(client))
		return;
	
	ApplyClanTag(client);
}


void ApplyClanTag(int client)
{
	int PlayerFlagBit = GetUserFlagBits(client);
	switch(PlayerFlagBit)
    {
    	case ADMFLAG_RESERVATION:
        {
            CS_SetClientClanTag(client,"✦SVIP✦");
        }
        case ADMFLAG_VOTE:
        {
            CS_SetClientClanTag(client,"✦实习OP✦");
        }
         case ADMFLAG_VOTE|ADMFLAG_RESERVATION:
        {
            CS_SetClientClanTag(client,"✦实习OP✦");
        }
		case ADMFLAG_CHAT|ADMFLAG_VOTE|ADMFLAG_KICK:
        {
            CS_SetClientClanTag(client,"✦OP✦");
        }
        case ADMFLAG_CHAT|ADMFLAG_VOTE|ADMFLAG_KICK|ADMFLAG_RESERVATION:
        {
            CS_SetClientClanTag(client,"✦OP✦");
        }
        case ADMFLAG_CHAT|ADMFLAG_VOTE|ADMFLAG_SLAY|ADMFLAG_KICK|ADMFLAG_BAN:
        {
            CS_SetClientClanTag(client,"✦高级OP✦");
        }
        case ADMFLAG_CHAT|ADMFLAG_VOTE|ADMFLAG_SLAY|ADMFLAG_KICK|ADMFLAG_BAN|ADMFLAG_RESERVATION:
        {
            CS_SetClientClanTag(client,"✦高级OP✦");
        }
         case ADMFLAG_ROOT|ADMFLAG_CUSTOM1:
        {
            CS_SetClientClanTag(client,"✦技术组✦");
        }
        case ADMFLAG_ROOT|ADMFLAG_RESERVATION|ADMFLAG_CUSTOM1:
        {
            CS_SetClientClanTag(client,"✦技术组✦");
        }
        case ADMFLAG_ROOT:
        {
            CS_SetClientClanTag(client,"✦服主✦");
        }
         case ADMFLAG_ROOT|ADMFLAG_RESERVATION:
        {
            CS_SetClientClanTag(client,"✦服主✦");
        }
	}
}
