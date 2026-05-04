# ARB

Architecture Review Board Template — a small static app that walks an
author through:

1. **Select ARB size** — Small, Medium, Large, or X-Large. Each size sets
   how many reviewers are required and the expected turnaround.
2. **Approval process** — auto-assigned reviewers based on the chosen
   size, plus a notes field. The ARB can be submitted only once every
   required reviewer has approved.
3. **Summary** — confirmation screen with the captured details.

## Run it

Open `index.html` in a browser, or serve the directory:

```bash
python3 -m http.server 8000
```

Then visit `http://localhost:8000`.

## Files

- `index.html` — markup and step views
- `styles.css` — layout and theming
- `app.js` — view switching, size selection, and approval state
