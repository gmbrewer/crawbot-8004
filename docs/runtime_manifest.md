# Runtime Manifest — Crawbot 8004

This file defines the grounding rules for any AI session interacting with this repository.

Before proposing design changes, generating code, or issuing operational instructions, the AI must perform a Grounding Block using the information contained in this repository.

This prevents architecture drift, hallucinated file paths, and incorrect assumptions about system state.

---

## Grounding Procedure

Every session must begin with a Grounding Block containing the following four elements:

1. **Current Authoritative Checkpoint**

   Identify the most recent file in:

   `docs/checkpoints/`

   This file defines the canonical project state.

2. **Verified Repository Surface**

   The AI must reference the actual repository structure rather than assuming file locations or module names.

3. **Target Operation**

   Clearly identify what file or component is being created or modified.

4. **Unknowns**

   Any information not explicitly confirmed by the repository must be treated as unknown and clarified before proceeding.

If any of these cannot be satisfied, the AI must stop and ask for clarification rather than continuing.

---

## Documentation Guardrails

### Documentation Completeness Requirement

All documentation generated for the repository — including checkpoints, state records, architecture notes, or decision logs — must be treated as authoritative project memory and therefore must be complete at the time it is presented for commit.

The assistant must assume that repository documentation is intended to persist across sessions and serve as a reliable recovery point. As a result, the following rules apply:

1. Documentation must be internally validated for completeness before it is presented.
2. The assistant must cross-check the document against all available evidence, including:
   - repository structure
   - runtime system state
   - configuration files
   - prior checkpoints
   - relevant logs or command outputs
3. The document must capture all material aspects of the current state relevant to project recovery or continuation.
4. Documentation should be presented only when it is ready to be committed without further amendment.
5. The user should not need to request additional completeness checks.

If uncertainty exists about whether the document is complete, the assistant must perform additional inspection before presenting the document rather than presenting a partial draft.

This rule applies both to documentation generation and documentation validation.

---

## Project Context

**Project:** crawbot-8004

**Purpose:**  
Test agent ↔ Superfluid interaction using the ERC-8004 standard on the Base network.

**Environment:**

Host: AWS EC2  
Agent Gateway: OpenClaw  
Primary Model: gpt-5.3-codex  
Network: Base  

The bot communicates via Telegram and executes actions through the OpenClaw agent framework.

---

## Repository Role

This repository is the authoritative memory surface for the project.

It contains:

- architectural decisions
- project checkpoints
- integration planning
- operational state

The runtime infrastructure may exist elsewhere (EC2, OpenClaw, Telegram, wallet providers), but the design and project memory live here.

---

## Documentation Structure

docs/
  checkpoints/        authoritative project milestones
  state/              current operational configuration
  decision_log.md     architectural decisions
  integration_plan.md integration roadmap
  runtime_manifest.md grounding rules for AI sessions

---

## Operating Principle

When uncertainty exists:

Prefer repository truth over conversational memory.

The repository is the durable project record.

AI conversational memory is not.
