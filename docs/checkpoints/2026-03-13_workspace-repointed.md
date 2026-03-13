# Checkpoint — 2026-03-13
## Crawbot 8004 Workspace Repointed

This checkpoint records the migration of the crawbot-8004 agent to its dedicated project workspace and repository.

---

# Objective

Move the `sf8004` OpenClaw agent from the shared workspace to the dedicated project repository so that:

- project memory lives in the repo
- agent execution occurs inside the project workspace
- future development is isolated from other OpenClaw projects

---

# Previous Workspace

/home/ubuntu/.openclaw/workspace

This shared workspace was used by multiple OpenClaw agents and was not appropriate for long-term development of the crawbot-8004 project.

---

# New Workspace

/home/ubuntu/projects/crawbot-8004

This directory contains the cloned GitHub repository:

https://github.com/gmbrewer/crawbot-8004

The repository now serves as both:

- the authoritative project memory surface
- the agent runtime workspace

---

# Agent Configuration

Agent ID:
sf8004

Agent model:
openai-codex/gpt-5.3-codex

Agent directory:
/home/ubuntu/.openclaw/agents/sf8004/agent

Workspace:
/home/ubuntu/projects/crawbot-8004

Telegram binding:
telegram:crawbot8004

Bot identity:
@crawbot8004_bot

---

# Wallet Identity

Network:
Base

Wallet address:
0xd2c2E4158661E641E97a640A83A7D2624D7c3A68

The wallet is funded with a minimal amount of ETH and is dedicated to ERC-8004 / Superfluid testing.

---

# Project Repository

Repository:
https://github.com/gmbrewer/crawbot-8004

Repository structure:

docs/
  checkpoints/
  state/
  decision_log.md
  integration_plan.md
  runtime_manifest.md

This repository now serves as the authoritative project documentation layer.

---

# Known Operational Note

OpenClaw reports doctor warnings related to Telegram group messaging configuration.

The following policies are currently set to `allowlist` but do not yet contain sender IDs:

- channels.telegram
- channels.telegram.accounts.default
- channels.telegram.accounts.crawbot8004

Effect:

Direct messages work normally.

Group messages would be silently dropped.

This is acceptable for the current phase because crawbot-8004 is being operated via direct message only.

---

# System Status

At the conclusion of this checkpoint:

• crawbot-8004 agent is operational  
• Telegram control surface is functioning  
• workspace has been migrated to the dedicated project repo  
• upstream repository contains full project documentation  

The project is now ready to begin **Phase 2: ERC-8004 capability discovery and Superfluid integration**.
