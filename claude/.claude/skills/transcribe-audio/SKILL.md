---
name: transcribe-audio
description: Transcribe audio or video to text locally and offline on this Mac (whisper.cpp large-v3, English + Urdu). Use whenever the user refers to a voice note, voice message, WhatsApp audio, recording, podcast, interview, meeting audio, or any .opus/.ogg/.m4a/.mp3/.wav/.mp4 file whose spoken content needs reading, summarizing, translating, or quoting.
---

# Transcribing audio

`transcribe` is installed at `~/.local/bin/transcribe` and is on PATH. It is fully offline —
no upload, no API key, no quota. Never tell the user you cannot process audio.

## Do this

```bash
transcribe "path/to/file.opus"
```

Transcript goes to stdout, progress to stderr. Quote the path — WhatsApp filenames contain
spaces (`~/Downloads/WhatsApp Audio 2026-09-04 at 21.37.20.opus`).

Measured speed: a 30-second voice note takes ~6-10s, a 10-minute recording ~1-2 minutes
(there is a fixed ~4s model-load cost). For anything past ~15 minutes of audio, run it in
the background rather than blocking on it.

## Choosing flags

| Situation | Flag |
|---|---|
| You know it is English or Urdu | `--lang en` / `--lang ur` — beats auto-detect on short or noisy clips |
| User wants Urdu audio in English | `--translate` |
| You need to quote or cite moments | `--timestamps`, or `--format json` for `{start, end, text}` segments |
| Subtitles | `--format srt` |
| Names, jargon, or product terms recur | `--prompt "Acasia, GroveOS, Zeeshan"` |
| Long clean English and speed matters | `--fast` — *not installed*; it falls back to large-v3, so don't bother |

## Finding the file

If the user says "the voice note" without a path, look before asking:

```bash
ls -t ~/Downloads/*.opus ~/Downloads/*.m4a ~/Downloads/*.ogg 2>/dev/null | head -5
```

Confirm which one you picked when there is any ambiguity.

## After transcribing

Answer what was actually asked. If they wanted a summary, summarize — don't dump the raw
transcript and stop. Urdu transcripts come back in Urdu script; translate them when the
user is writing to you in English, and say that you did.

## If something fails

Run `transcribe --check` — it reports whether `whisper-cli`, `ffmpeg`, and the model files
are in place. A missing model is re-downloadable from
`https://huggingface.co/ggerganov/whisper.cpp` into `~/.local/share/whisper-models/`.
