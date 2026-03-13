# Crawbot 8004 — Decision Log

This document records the architectural decisions made during development of the crawbot-8004 project. The goal is to preserve the reasoning behind system design so future sessions or collaborators can understand the intent of the system.

---

## Decision 001 — Reuse Existing OpenClaw Gateway

Date: 2026-03-13

Decision:
The project will reuse the existing OpenClaw gateway running on the EC2 host rather than deploying a second gateway instance.

Rationale:
The OpenClaw gateway is designed to support multiple agents simultaneously. Running additional gateways adds unnecessary complexity and increases operational surface area.

Implementation:
A new isolated agent namespace is created under:

~/.openclaw/agents/sf8004

The gateway continues running on:

127.0.0.1:18789

The existing gateway manages both the original agent and the new crawbot-8004 agent.

---

## Decision 002 — Agent Namespace Isolation

Date: 2026-03-13

Decision:
Each bot will run inside its own OpenClaw agent namespace.

Rationale:
Isolation prevents configuration collisions between agents and ensures each bot can maintain its own environment variables, session history, and runtime state.

Implementation:

Agent namespace:
~/.openclaw/agents/sf8004

Associated directories include:

~/.openclaw/agents/sf8004/agent
~/.openclaw/agents/sf8004/sessions

---

## Decision 003 — Dedicated Telegram Bot Identity

Date: 2026-03-13

Decision:
The ERC-8004 test agent will operate through its own Telegram bot identity.

Rationale:
Separate Telegram bots prevent command collisions and allow independent control and testing of agents.

Implementation:

Telegram account name:
crawbot8004

Telegram bot:
@crawbot8004_bot

The bot is bound to the OpenClaw agent:

sf8004

---

## Decision 004 — Dedicated Wallet for Agent

Date: 2026-03-13

Decision:
The ERC-8004 testing agent uses a dedicated Base network wallet.

Rationale:
Using a dedicated wallet isolates agent activity from personal or production wallets and ensures all transactions can be clearly attributed to the test environment.

Implementation:

Network:
Base

Wallet address:
0xd2c2E4158661E641E97a640A83A7D2624D7c3A68

The wallet is funded with a small amount of ETH to support transaction testing.

---

## Decision 005 — Repository as Project Memory Surface

Date: 2026-03-13

Decision:
A dedicated GitHub repository (crawbot-8004) will serve as the authoritative project memory.

Rationale:
Interactive AI sessions cannot reliably retain long-term architectural context. Storing project state in a repository ensures decisions, checkpoints, and integration plans remain durable.

Implementation:

Repository:
https://github.com/gmbrewer/crawbot-8004

Documentation structure:

docs/
  checkpoints/
  state/
  decision_log.md
  integration_plan.md
  runtime_manifest.md

---

## Decision 006 — Repository Template for Future Bots

Date: 2026-03-13

Decision:
The crawbot-8004 repository is configured as a GitHub template.

Rationale:
Future bots can be created quickly by cloning the template repository, ensuring consistent documentation and project structure across agents.

Implementation:

GitHub setting enabled:

Template repository

Future bots can be created using:

Use this template

---

## Decision 007 — Operational State vs Checkpoints

Date: 2026-03-13

Decision:
Operational configuration and identity information will be stored separately from project checkpoints.

Rationale:
Checkpoints represent historical milestones while operational state represents current runtime configuration.

Implementation:

docs/checkpoints/ — authoritative milestones  
docs/state/ — current runtime configuration
