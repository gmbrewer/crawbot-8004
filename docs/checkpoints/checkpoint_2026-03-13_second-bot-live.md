# checkpoint_2026-03-13_second-bot-live.md

## Checkpoint: Second Bot Live (sf8004)

Date: 2026-03-13  
Recovered/confirmed: 2026-03-14  
Status: Historical checkpoint reconstructed from repository history, runtime configuration, and system logs.

---

## Summary

A second OpenClaw agent (`sf8004`) was configured and verified operational to support ERC-8004 / Superfluid experimentation. The bot was bound to a dedicated Telegram identity and connected through the local OpenClaw gateway.

This checkpoint file was originally created in the repository during the setup process but was inadvertently committed without its contents. The information below reconstructs the checkpoint using verifiable runtime artifacts and repository history.

---

## Agent Identity

Agent ID: sf8004  
Configured Name: sf8004  

Runtime agent directory:

~/.openclaw/agents/sf8004

Agent configuration source:

~/.openclaw/openclaw.json

Relevant configuration excerpt:

agents.list[1]:
  id: sf8004
  workspace: /home/ubuntu/projects/crawbot-8004
  agentDir: /home/ubuntu/.openclaw/agents/sf8004/agent
  model: openai-codex/gpt-5.3-codex

---

## Messaging Binding

The agent was bound to a Telegram bot identity.

Binding configuration:

channel: telegram  
accountId: crawbot8004  

Telegram bot identity:

@crawbot8004_bot

Gateway logs confirm successful provider startup:

[telegram] [crawbot8004] starting provider (@crawbot8004_bot)

---

## Gateway Environment

OpenClaw gateway service:

openclaw-gateway.service

Service characteristics:

OpenClaw version: v2026.3.2  
gateway mode: local  
bind: 127.0.0.1  
port: 18789

Observed startup sequence:

[gateway] listening on ws://127.0.0.1:18789  
[browser/server] Browser control listening on http://127.0.0.1:18791/  
[telegram] provider started

---

## Workspace Evolution

Initial OpenClaw bootstrap workspace:

~/.openclaw/workspace-sf8004

This workspace contained the standard OpenClaw template scaffold:

AGENTS.md  
BOOTSTRAP.md  
SOUL.md  
IDENTITY.md  
USER.md  
TOOLS.md  
HEARTBEAT.md

Later in the same setup sequence the agent workspace was repointed to the project repository:

/home/ubuntu/projects/crawbot-8004

This repoint was recorded in OpenClaw configuration audit logs:

config.write → agents.list[1].workspace  
/home/ubuntu/projects/crawbot-8004

The original workspace (`workspace-sf8004`) was intentionally preserved as a reusable default bot template environment.

---

## Verification and Recovery (2026-03-14)

During repository recovery and validation, the following checks were performed.

### Infrastructure

- repository verified clean and synchronized with origin
- OpenClaw gateway configuration confirmed
- agent workspace repoint confirmed in configuration logs

Gateway status was initially found **inactive** during validation:

openclaw-gateway.service → inactive (dead)  
no listener present on port 18789

The service was manually restarted:

systemctl --user start openclaw-gateway.service

After restart:

ActiveState = active  
SubState = running  
gateway listening on port 18789

### Messaging verification

Telegram DM sent to:

@crawbot8004_bot

Example exchange:

User: ping  
Bot:  pong

Gateway logs confirm Telegram websocket activity:

[ws] ⇄ res ✓ send ... channel=telegram

---

## Resulting System Structure

OpenClaw Gateway
   │
   ├─ agent: main
   │
   └─ agent: sf8004
         │
         ├─ workspace → /home/ubuntu/projects/crawbot-8004
         │
         └─ runtime state
              ~/.openclaw/agents/sf8004

Template workspace retained separately:

~/.openclaw/workspace-sf8004

---

## Reconstruction Sources

This checkpoint was reconstructed using:

- repository commit history
- OpenClaw runtime configuration (~/.openclaw/openclaw.json)
- OpenClaw configuration audit logs
- systemd service inspection
- gateway journal logs
- Telegram runtime verification

---

## Outcome

At this checkpoint:

- The second bot (`sf8004`) was configured and verified operational.
- Telegram connectivity was established and tested.
- The agent workspace was repointed to the project repository.
- The OpenClaw gateway service was restored and confirmed running.
- The system returned to a stable operational state suitable for ERC-8004 experimentation.
