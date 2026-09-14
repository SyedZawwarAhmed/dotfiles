---
name: owasp
description: Scan a codebase for OWASP vulnerabilities using the categories in the user's Udemy security course. Use for OWASP or AWASP scans, application security audits, and vulnerability reviews, including requests that clearly imply a security assessment. Ordinary feature work does not by itself require a full audit.
---

# OWASP

Perform an evidence-based security review of the current codebase. Explicit invocation in Claude Code: `/owasp`. Recognize “AWASP” as a spelling variant in natural-language requests.

This skill follows the syllabus of Scott Cosentino's Udemy course, *An Introduction to OWASP Top 10 Vulnerabilities*. It contains original review guidance supported by official OWASP references, not a transcript archive or a claim that every lecture was reviewed. Read [source scope](references/source-scope.md) for provenance and version limits.

## Review workflow

1. Establish the repository root, revision, user-requested scope, and repository instructions. Default to reviewing the current codebase when no narrower scope is specified. Identify languages, frameworks, entry points, identity and tenant boundaries, persistence, background jobs, integrations, dependency lockfiles, and deployment configuration.
2. Read [vulnerability checks](references/vulnerability-checks.md). Account for every category, including both injection subtypes. Search to locate candidates, then inspect callers, shared middleware, wrappers, configuration, and tests. A keyword hit is a lead, not a finding.
3. Trace attacker-controlled data or actions through reachable code to a sensitive operation. Include headers, cookies, uploaded files, stored records, queues, and integration responses where applicable. Check the actual protection on that path; authentication alone does not prove object authorization.
4. Validate candidates using code evidence and focused local tests where useful. Prefer existing test tools and disposable fixtures. A review does not authorize probing deployed systems, modifying production data, uploading repository contents to scanners, or changing access controls. Redact secret values in reports.
5. Check current vendor advisories for dependency claims and version-specific framework behavior when tools permit. If external verification is unavailable, distinguish an unresolved advisory check from a confirmed vulnerable dependency. Do not infer insecure defaults without checking the installed version and configuration.
6. Report actionable findings ordered by impact and likelihood. Do not change application code unless the user's request includes fixes. For authorized fixes, preserve intended behavior, add an appropriate regression check, and review the affected path again.

## Evidence and reporting

For each finding give: severity and confidence; category with its edition (course IDs are OWASP 2017); precise file and line; attacker prerequisites; the reachable failure path; concrete impact; existing protections and why they fail; a practical correction; and validation performed or still needed. Separate confirmed findings from questions needing deployment or runtime evidence. Avoid invented CVSS scores and speculative exploitability.

End with a compact coverage table for A1 SQL, A1 command, and A2–A10: `reviewed—finding`, `reviewed—no finding`, `not applicable`, or `blocked`, with evidence or reason. Include inspected scope, checks actually run, and material exclusions. Do not describe a static review as a penetration test or a guarantee of security. If nothing is confirmed, say “No confirmed findings in the reviewed scope.”

The course is a historical baseline. If asked for the current OWASP Top 10 or a comprehensive assessment, consult the current official edition, explicitly extend coverage, and label additional checks separately. Do not present the course categories alone as complete current-edition coverage.
