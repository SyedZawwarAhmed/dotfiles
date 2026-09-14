---
name: tmux-window-name
description: Name the tmux window after whatever this chat is about, with a glyph showing whether it is working, waiting on you, or idle. Use when a hook asks for a window name, when the user says rename/retitle the tmux window or tab, when the topic of a long conversation has clearly shifted, or when they ask how the automatic tmux naming and status markers work.
---

# tmux window naming

The user always runs Claude Code inside tmux. Each window should say what its chat is
about and what it is doing, so a row of windows reads like a task list instead of five
copies of `zsh`:

```
✳ auth-redirect-bug     working
! grove-pipeline-schema wants input — permission prompt or question
✓ whisper-vad-tuning    idle, turn finished
```

## Renaming

```bash
tmux-window-name set "auth redirect bug"
```

Run it, say nothing about it, and carry on with the actual work. It is a one-line side
effect, not a deliverable — no announcement, no "I've renamed your window", no asking
permission first.

Pick a **topic, not an action**: what the conversation is about, 2-4 words.

| Good | Bad |
|---|---|
| `auth redirect bug` | `fixing the auth redirect bug for you` |
| `grove pipeline schema` | `investigating` |
| `whisper vad tuning` | `claude-code` |

The script hyphenates, strips `#`, caps at 28 chars and prepends the state glyph, so
`set "auth redirect bug"` shows up as `✳ auth-redirect-bug`. The name and the glyph are
stored separately — changing one never disturbs the other.

## When to run it

- A `[tmux]` hint arrives on the first prompt of a session — rename as soon as the topic
  is clear, which is usually immediately.
- The subject genuinely changes mid-session (auth bug → deploy pipeline). Not on every
  turn; a window name that flickers is worse than a stale one.
- The user asks directly. Use their words if they give any.

Don't rename in a subagent — it fights with the main session over the same window.

## Status markers

The glyph is driven entirely by hooks; you never need to set it by hand.

| Event | Glyph | Also |
|---|---|---|
| `UserPromptSubmit` | `✳` working | — |
| `Notification` | `!` needs input | macOS notification + window bell |
| `Stop` | `✓` idle | — |

`tmux-window-name state busy\|wait\|done` sets it manually if something gets stuck.

Note: `!` clears at the end of the turn, not the instant a permission prompt is answered —
there is no "permission granted" event to hook, and hooking every tool call to catch it
would tax each one. A stale `!` mid-turn is harmless and self-corrects at `Stop`.

## Everything else

```bash
tmux-window-name status     # name, base, state, original name, whether Claude named it
tmux-window-name restore    # put the pre-session name back
```

Hooks in `~/.claude/settings.json` drive all of it: `SessionStart` titles the window after
the project directory, the first `UserPromptSubmit` swaps in keywords from the prompt and
emits the `[tmux]` hint, `Notification`/`Stop` move the glyph, `SessionEnd` restores the
old name. The script turns tmux's `automatic-rename` and `allow-rename` off for the window
(saving the prior values) so the shell can't overwrite the name; `restore` puts those
settings back too.

Knobs, all optional env vars:

| Var | Default | Effect |
|---|---|---|
| `CLAUDE_TMUX_ICON` | `✳` | working glyph; empty for none |
| `CLAUDE_TMUX_ICON_WAIT` | `!` | needs-input glyph |
| `CLAUDE_TMUX_ICON_DONE` | `✓` | idle glyph |
| `CLAUDE_TMUX_NOTIFY` | `os` | macOS banner titled *Claude Code*, subtitled with the window name; `tmux` swaps it for a status-line flash; `off` silences both |
| `CLAUDE_TMUX_MAXLEN` | `28` | max name length |
| `CLAUDE_TMUX_AUTORENAME` | `first` | `each` re-derives from every prompt, not just the first |
| `CLAUDE_TMUX_KEEP_NAME` | unset | `1` leaves the name behind on exit |

Outside tmux every command is a silent no-op.
