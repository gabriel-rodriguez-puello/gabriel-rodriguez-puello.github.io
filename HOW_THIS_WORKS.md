# How Your Academic Website Works

## The Big Picture

Your site is built with **Hugo** (a static site generator) using the **PaperMod** theme.
You write content in simple text files (Markdown), Hugo converts them into HTML, and the result is hosted for free on **GitHub Pages**.

The live site is at: https://gabriel-rodriguez-puello.github.io

---

## Where Everything Lives

All files are in:
```
C:\Users\RodGab\OneDrive - Jonkoping University\website\
```

The key files and folders:

```
website/
│
├── config.yml              ← Homepage content, bio, social links, buttons, news section
│
├── static/
│   ├── picture.png         ← Your profile photo
│   ├── cv.pdf              ← Your CV (replace this file to update it)
│   └── jmp.pdf             ← Your job market paper PDF
│
├── content/
│   ├── papers/
│   │   ├── paper1/         ← JMP
│   │   ├── paper2/         ← Labour Economics
│   │   ├── paper3/         ← Entrepreneurship
│   │   ├── paper4/         ← Journal of Development Studies
│   │   ├── paper5/         ← Journal of Happiness Studies
│   │   ├── paper6/         ← Competition Networks
│   │   ├── paper7/         ← Investment Freedom
│   │   ├── paper8/         ← Fertility & Family Formation
│   │   └── paper9/         ← Pre-PhD publications & book chapters
│   │
│   └── courses/
│       └── course1/        ← Teaching experience
│
├── layouts/
│   ├── partials/
│   │   ├── index_profile.html   ← Controls homepage layout (photo + text)
│   │   └── extend_head.html     ← Custom CSS styles
│   └── papers/
│       └── list.html            ← Controls how papers are grouped by category
│
└── themes/PaperMod/        ← The theme (do not edit files here)
```

---

## What Each File Does

### `config.yml` — The Main Settings File
This controls everything on the **homepage**:
- Your name and title
- The bio paragraph
- Research fields
- The **Recent** news section (publications, conferences)
- The social icons (Email, Google Scholar, ORCID, LinkedIn, GitHub)
- The buttons (Job Market Paper, CV, Papers, Courses)
- Your profile photo

**To update the news section**, find this part in config.yml:
```yaml
      **Recent**

      - *Labour Economics* — "..." (2026)
      - *The Journal of Development Studies* — "..." (2025)
      - **2026 conferences:** EALE · ESPE · ...
```
Just edit the text directly.

### `content/papers/paperX/index.md` — Each Paper Page
Each paper has its own folder. Inside is one `index.md` file with:
- `title` — paper title
- `summary` — shown in the papers list (journal, coauthors)
- `category` — controls which section it appears in:
  - `"jmp"` → Job Market Paper
  - `"working"` → Working Papers
  - `"published"` → Published & Forthcoming
  - `"other"` → Other Publications
- `editPost.URL` — link to journal page (DOI)
- The abstract, figure, and citation in the body

**To add a new paper**: copy an existing paper folder, rename it (e.g. `paper10`), and edit the `index.md`.

**To add/replace a figure**: put a file named `figure.png` inside the paper's folder.

### `static/cv.pdf` — Your CV
To update your CV, simply replace this file with your new PDF.
Keep the filename exactly `cv.pdf`.

### `static/jmp.pdf` — Your JMP
Replace with the latest version. Keep filename `jmp.pdf`.

### `static/picture.png` — Your Photo
Replace with a new photo. Keep filename `picture.png`.

### `content/courses/course1/index.md` — Teaching Page
Plain Markdown with your teaching history organized by graduate/undergraduate level.

---

## How to Publish Changes

Every time you edit something, you need to push to GitHub. The site updates automatically within ~2 minutes.

### If you have Claude Code open:
Just ask Claude to make the change, then run:
```
! cd "C:\Users\RodGab\OneDrive - Jonkoping University\website" && git add . && git commit -m "describe what changed" && git push
```

### If you are on your own (without Claude):
1. Edit the relevant file directly (in Notepad, VS Code, or any text editor)
2. Open a terminal in the website folder
3. Run:
```bash
git add .
git commit -m "describe what changed"
git push
```

### To preview locally before publishing:
Double-click `preview.bat` in the website folder.
Then open your browser at: http://localhost:1313

---

## Common Tasks

### Update your bio or research description
→ Edit `config.yml`, find the `subtitle:` block

### Add a new conference to the news section
→ Edit `config.yml`, find `**Recent**`, update the conferences line

### Add a new publication
→ Change `category: "working"` to `category: "published"` in the paper's `index.md`
→ Update `description`, `summary`, `editPost.Text`, and the `Citation` section

### Add a completely new paper
→ Create a new folder `content/papers/paper10/`
→ Copy `index.md` from an existing paper and edit all fields
→ Add `figure.png` if you have a figure

### Update your CV
→ Replace `static/cv.pdf` with your new file (keep same filename)

### Update your JMP PDF
→ Replace `static/jmp.pdf` with your new file (keep same filename)

### Change your profile photo
→ Replace `static/picture.png` with your new file (keep same filename)

### Add/remove social icons
→ Edit `config.yml`, find `socialIcons:`, add or delete entries
→ Supported names: `Email`, `Google Scholar`, `ORCID`, `LinkedIn`, `GitHub`, `CV`

---

## GitHub

**Repository:** https://github.com/gabriel-rodriguez-puello/gabriel-rodriguez-puello.github.io

Every time you push, GitHub Actions automatically:
1. Runs Hugo to build the site
2. Deploys it to GitHub Pages

You can watch the build at:
https://github.com/gabriel-rodriguez-puello/gabriel-rodriguez-puello.github.io/actions

If the build fails (red X), something is wrong with the files — check the error log there.

---

## File Format: Markdown

All content files use Markdown. The basics:

```markdown
**bold text**
*italic text*
[link text](https://url.com)
# Big heading
## Medium heading
- bullet point
```

The block at the top of each file (between `---` lines) is YAML frontmatter — it controls metadata like title, date, category, etc.

---

## Things NOT to Edit

- Anything inside `themes/PaperMod/` — this is the theme, changes there get overwritten
- `layouts/partials/index_profile.html` — controls the homepage photo layout (complex)
- `layouts/partials/extend_head.html` — custom CSS (complex)
- `layouts/papers/list.html` — controls paper grouping (complex)

If you need to change any of these, ask Claude.

---

## Summary: Most Common Updates (5 minutes each)

| Task | File to edit |
|------|-------------|
| Update news/bio | `config.yml` |
| Add new paper | New `content/papers/paperX/index.md` |
| Mark paper as published | Edit `category`, `description`, `summary` in paper's `index.md` |
| Update CV | Replace `static/cv.pdf` |
| Update JMP | Replace `static/jmp.pdf` |
| Update teaching | `content/courses/course1/index.md` |
| Change photo | Replace `static/picture.png` |
