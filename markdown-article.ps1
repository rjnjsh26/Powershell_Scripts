# Create a Markdown article demonstrating common Markdown syntax.

$markdownContent = @'
# My Complete Markdown Syntax Article

## Introduction

Markdown is a simple language used to format plain-text documents.

> Markdown makes it easy to create clean documentation, notes, and README files.

---

## Text Formatting

This is **bold text**.

This is *italic text*.

This is ***bold and italic text***.

This is ~~strikethrough text~~.

This is `inline code`.

---

## Headings

# Heading Level 1

## Heading Level 2

### Heading Level 3

#### Heading Level 4

##### Heading Level 5

###### Heading Level 6

---

## Lists

### Unordered List

- First item
- Second item
- Third item
- Nested item example
  - Nested item one
  - Nested item two

### Ordered List

1. First step
2. Second step
3. Third step

### Task List

- [x] Create the PowerShell file
- [x] Create the Markdown article
- [ ] Add the files to Git
- [ ] Submit the assignment

---

## Links and Images

[Visit GitHub](https://github.com)

[Visit Microsoft](https://www.microsoft.com)

![Example image description](https://via.placeholder.com/300x150)

---

## Tables

| Tool | Purpose | Status |
|---|---|---|
| VS Code | Write code and Markdown | Complete |
| PowerShell | Run the script | Complete |
| Git | Track file changes | In progress |

### Alignment Table

| Left | Center | Right |
|:---|:---:|---:|
| Security | Cloud | Git |
| Excel | Lab | Report |

---

## Code Blocks

### PowerShell Example

```powershell
Write-Host "Hello, Rajan!"
Get-Date
```

### Python Example

```python
name = "Rajan"
print(f"Hello, {name}!")
```

---

## Blockquotes

> This is a blockquote.
>
> It can have multiple lines.

> > This is a nested blockquote.

---

## Horizontal Lines

Three hyphens make a horizontal line:

---

Three asterisks also make a horizontal line:

***

---

## Escaped Characters

\*This text is not italic.\*

\#This text is not a heading.

\[This text is not a link.\]

---

## HTML Inside Markdown

<details>
<summary>Click here to view hidden content</summary>

This information is inside a collapsible section.

</details>

---

## Footnote

This sentence includes a footnote.[^1]

[^1]: This is the footnote explanation.

---

## Conclusion

This article demonstrates headings, bold text, italic text, strikethrough, lists, task lists, links, images, tables, code blocks, blockquotes, horizontal lines, escaped characters, HTML, and footnotes.

**Author:** Rajan Josh Dela Cruz  
**Date:** October 5, 2026
'@

$markdownContent | Out-File -FilePath ".\markdown-guide.md" -Encoding utf8

Write-Host ""
Write-Host "SUCCESS: markdown-guide.md was created." -ForegroundColor Green
Write-Host "Open it in VS Code and press Ctrl + Shift + V to preview it." -ForegroundColor Yellow