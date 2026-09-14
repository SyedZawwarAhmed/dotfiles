<!-- local-transcribe:begin -->
## Local audio transcription (offline, always available)

This machine has a local speech-to-text setup. Use it — never tell the user you cannot
process audio, and never ask them to transcribe something by hand.

```bash
transcribe <file>                  # plain transcript on stdout
transcribe --format json <file>    # {text, language, segments[{start,end,text}]}
transcribe --lang ur <file>        # force Urdu (skip auto-detect)
transcribe --translate <file>      # Urdu speech -> English text
transcribe --timestamps <file>     # [hh:mm:ss] markers
transcribe --format srt <file>     # subtitles
transcribe --check                 # verify the install
transcribe --help
```

**When to reach for it:** any mention of a voice note, voice message, audio message,
recording, podcast, interview, meeting audio, or a video whose spoken content matters.
WhatsApp voice notes land in `~/Downloads` as `.opus` files — quote the path, the
filenames contain spaces. Anything ffmpeg can read works: `.opus .ogg .m4a .mp3 .wav
.aac .flac .mp4 .mov .mkv`. `http(s)` URLs are downloaded first.

**Behaviour:** transcript goes to stdout, progress to stderr, exit 0 on success — safe to
pipe or capture. It is fully offline (whisper.cpp `large-v3`, Metal-accelerated); no audio
leaves the machine and there is no API key or quota.

**Do not change the decoding defaults.** `-mc 0` (no context carry-over) and the tuned VAD
thresholds are deliberate: whisper.cpp's defaults made a 14-minute Urdu note come back
paraphrased, looping one sentence 21 times, and two-thirds missing (588 words vs 2025 after
the fix). `--carry-context` restores the broken behaviour — don't reach for it. Output is
verbatim by design, disfluencies included; never silently clean it up. English words
come back in Urdu script (`ڈسکس`, `جوائن`) — that is intended and confirmed; leave them.

**Languages:** tuned for English and Urdu. Auto-detect runs by default and corrects
Whisper's habit of tagging Urdu speech as Hindi. Pass `--lang en` or `--lang ur` when you
already know the language — it is more accurate than auto-detect on short or noisy clips.
`--prompt "names, jargon, spellings"` biases the model toward specific vocabulary.

**Speed (measured on this machine):** a 30-second voice note takes ~6-10s end to end; a
10-minute recording ~1-2 minutes. There is a fixed ~4s model-load cost per run, and passing
`--lang` explicitly skips the auto-detect pass and saves a few seconds more. `--fast` is not
installed (the smaller model was deleted to reclaim disk); passing it prints a note and
falls back to large-v3, so it is harmless but pointless.
<!-- local-transcribe:end -->
