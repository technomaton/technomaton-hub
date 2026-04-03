---
name: secure-dev-workflow
description: >
  Use when developing security-sensitive features — orchestrates threat
  modeling, secure implementation with TDD, and security audit using
  TECHNOMATON security pack and vendored superpowers skills.
license: MIT
compatibility: Designed for Claude Code
allowed-tools: Read Grep Glob Bash
disable-model-invocation: true
metadata:
  author: TECHNOMATON Team
  version: 1.0.0
  tier: community
  source: original
  composed-from:
    - pack: tm-secure/deps-health
    - vendor: superpowers/brainstorming
    - vendor: superpowers/test-driven-development
    - vendor: superpowers/systematic-debugging
    - pack: tm-secure/secret-scan
    - vendor: superpowers/verification-before-completion
    - pack: tm-dx/pr-review
---

# Secure Development Workflow

Orchestrates security-first development by combining TECHNOMATON security
skills with superpowers development workflow.

## When to Use

- Implementing authentication, authorization, or access control
- Handling sensitive data (PII, credentials, tokens)
- Building API endpoints exposed to external clients
- Any feature flagged as security-sensitive

## Phase 1: Threat Modeling

Start with security analysis before writing any code:

1. Identify assets at risk
2. Map trust boundaries and data flows
3. Enumerate threats (STRIDE or relevant framework)
4. Define security requirements and acceptance criteria
5. Document in threat model spec

Use superpowers:brainstorming for structured design exploration,
with security as the primary lens.

**Exit condition:** Threat model approved, security requirements defined.

## Phase 2: Secure Implementation

Implement using superpowers:test-driven-development with security focus:

1. **RED:** Write security-focused tests first
   - Input validation tests
   - Authentication/authorization tests
   - Error handling tests (no information leakage)
2. **GREEN:** Implement with secure coding practices
   - Parameterized queries (no SQL injection)
   - Output encoding (no XSS)
   - Proper error handling (no stack traces to users)
3. **REFACTOR:** Review for security patterns

Use superpowers:systematic-debugging for any security-related issues.

**Exit condition:** All security tests pass.

## Phase 2.5: Verification (superpowers:verification-before-completion)

Before proceeding to security audit, invoke superpowers:verification-before-completion to:

1. Run all tests and confirm they pass
2. Verify no regressions in existing functionality
3. Confirm implementation matches the threat model requirements
4. Provide evidence of completion before claiming ready for audit

**Exit condition:** Verification evidence collected, all checks green.

## Phase 3: Security Audit

Run security scan and review:

1. Invoke tm-secure security scanning commands
2. Check for OWASP Top 10 vulnerabilities
3. Review secrets/credentials handling
4. Validate input sanitization
5. Check dependency vulnerabilities

**Exit condition:** Security scan clean, no critical/high findings.

## Phase 4: Secure Review

Invoke tm-dx:pr-review with additional security checklist:

1. Standard PR review checklist
2. Security-specific review points:
   - No hardcoded secrets
   - Proper authentication checks
   - Input validation at system boundaries
   - Secure error handling
3. Request review from security-reviewer agent if available

**Exit condition:** PR approved with security sign-off.
