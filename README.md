# Mini-Lexer (Tokenizer Template)

A standalone lexical analyzer template based on ANTLR 4 for tokenizing input character streams.

---

## 1. Prerequisites

### A. Java Development Kit (JDK 11+)
* **WSL / Linux:**
  ```bash
  # Check installation
  java -version && javac -version

  # Install if missing (Ubuntu/Debian)
  sudo apt update && sudo apt install default-jdk -y
  ```
* **Windows (PowerShell):**
  ```powershell
  # Check installation
  java -version; javac -version

  # Install via winget if missing
  winget install EclipseAdoptium.Temurin.17.JDK
  ```

### B. VS Code Extensions
1. **ANTLR4 grammar syntax support** (by *Mike Lischke*, ID: `mike-lischke.vscode-antlr4`):
   * Enables syntax highlighting, automatic file generation upon saving (`Ctrl + S`), and interactive rule diagrams.
   * **Note for WSL Users:** When working via VS Code Remote-WSL (`WSL: Ubuntu`), install this extension inside WSL ("Install in WSL: Ubuntu").
2. **WSL** (by *Microsoft*):
   * Required when developing inside WSL from Windows.

---

## 2. VS Code Extension Features for Lexer

1. **Automatic Lexer Generation:**
   * Saving `<LexerName>.g4` (`Ctrl + S`) automatically builds lexer artifacts into `.antlr/` using the local jar configured in `.vscode/settings.json`.
2. **Railroad Diagrams (State Machine Flow):**
   * Right-click on any lexer rule in `<LexerName>.g4` and choose **"ANTLR4: Show Railroad Diagram for Rule"** to view a visual flowchart representing the regular expression.
3. **ATN Graph:**
   * Right-click inside `<LexerName>.g4` and select **"ANTLR4: Show ATN Graph"** to inspect the transition network.

---

## 3. Running via Terminal

> **Template Placeholder:** Replace `<LexerName>` with your lexer grammar name (e.g. `vrlexer`).

### Option A: WSL / Linux (Bash)
```bash
# 1. Create output directory
mkdir -p .antlr

# 2. Generate lexer files
java -jar utils/antlr-4.13.1-complete.jar -o .antlr <LexerName>.g4

# 3. Compile runner and generated sources
javac -d .antlr -cp ".:utils/antlr-4.13.1-complete.jar" lexer.java .antlr/<LexerName>.java

# 4. Run the lexer
java -cp ".antlr:utils/antlr-4.13.1-complete.jar" lexer
```

**Clean up (WSL / Linux):**
```bash
rm -rf .antlr && mkdir -p .antlr
```

---

### Option B: Windows (PowerShell)
*(Note: Classpath delimiter is `;` on Windows)*

```powershell
# 1. Create output directory
if (!(Test-Path .antlr)) { New-Item -ItemType Directory -Path .antlr }

# 2. Generate lexer files
java -jar utils\antlr-4.13.1-complete.jar -o .antlr <LexerName>.g4

# 3. Compile runner and generated sources
javac -d .antlr -cp ".;utils\antlr-4.13.1-complete.jar" lexer.java .antlr\<LexerName>.java

# 4. Run the lexer
java -cp ".antlr;utils\antlr-4.13.1-complete.jar" lexer
```

**Clean up (Windows PowerShell):**
```powershell
if (Test-Path .antlr) { Remove-Item -Recurse -Force .antlr }; New-Item -ItemType Directory -Path .antlr
```

---

### Option C: Windows (Command Prompt / CMD)
```cmd
:: 1. Create output directory
if not exist .antlr mkdir .antlr

:: 2. Generate lexer files
java -jar utils\antlr-4.13.1-complete.jar -o .antlr <LexerName>.g4

:: 3. Compile
javac -d .antlr -cp ".;utils\antlr-4.13.1-complete.jar" lexer.java .antlr\<LexerName>.java

:: 4. Run
java -cp ".antlr;utils\antlr-4.13.1-complete.jar" lexer
```

**Clean up (Windows CMD):**
```cmd
rmdir /s /q .antlr 2>nul & mkdir .antlr
```

---

## 4. Dumping Raw Token Stream via ANTLR TestRig

* **WSL / Linux:**
  ```bash
  java -cp ".antlr:utils/antlr-4.13.1-complete.jar" org.antlr.v4.gui.TestRig <LexerName> tokens -tokens
  ```
* **Windows (PowerShell):**
  ```powershell
  java -cp ".antlr;utils\antlr-4.13.1-complete.jar" org.antlr.v4.gui.TestRig <LexerName> tokens -tokens
  ```
