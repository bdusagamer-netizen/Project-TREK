# Trek Language Distribution Guide

This guide explains how to package and distribute the Trek programming language.

## Quick Distribution Steps

### 1. Verify Package Contents

Ensure all files are in place:
```
trek/
├── trek.sample.trek
├── trek.schema.json
├── trek.tmLanguage.json
├── vscode-language-configuration.json
├── trek-language.json
├── package.json
├── README.md
├── LICENSE
├── LANGUAGE_SPEC.md
├── QUICK_REFERENCE.md
├── EXAMPLES.md
├── INSTALL.md
├── CONTRIBUTING.md
└── CHANGELOG.md
```

### 2. Build Distribution Package

**On macOS/Linux:**
```bash
bash build-distribution.sh
```

**On Windows:**
```bash
build-distribution.bat
```

This creates:
- `dist/trek-language-1.0.0.vsix` - VS Code extension
- `dist/trek-format-1.0.0.tgz` - npm package

### 3. Test Locally

#### Test VS Code Extension
1. Open VS Code
2. Go to Extensions (Ctrl+Shift+X)
3. Click "..." menu → "Install from VSIX..."
4. Select `dist/trek-language-1.0.0.vsix`
5. Create a test `.trek` file and verify syntax highlighting

#### Test npm Package
```bash
npm install -g dist/trek-format-1.0.0.tgz
```

## Distribution Channels

### Option 1: GitHub Releases (Free & Easy)

1. **Create GitHub Repository**
   ```bash
   git init
   git add .
   git commit -m "Initial Trek release"
   git remote add origin https://github.com/trek-lang/trek.git
   git push -u origin main
   ```

2. **Create Release**
   - Go to GitHub → Releases → "Create a new release"
   - Tag: `v1.0.0`
   - Title: `Trek v1.0.0`
   - Upload files:
     - `trek-language-1.0.0.vsix`
     - `trek-format-1.0.0.tgz`
     - Source code ZIP

3. **Share Release URL**
   - Users can download from: `https://github.com/trek-lang/trek/releases`

### Option 2: npm Registry (Public Packages)

**Prerequisites:**
- npm account: https://www.npmjs.com/signup
- Logged in: `npm login`

**Publish:**
```bash
npm publish --access public
```

**Users can install:**
```bash
npm install -g trek-format
```

### Option 3: VS Code Marketplace (Most Discoverable)

**Prerequisites:**
- Microsoft account
- VS Code extension publisher account

**Steps:**

1. **Create Personal Access Token**
   - Go to https://dev.azure.com/
   - Create new Personal Access Token with "Marketplace" scope

2. **Install vsce**
   ```bash
   npm install -g vsce
   ```

3. **Create Publisher**
   ```bash
   vsce create-publisher trek-lang
   ```

4. **Publish to Marketplace**
   ```bash
   vsce publish
   ```
   - Enter PAT when prompted

5. **Users can find**
   - Search "Trek" in VS Code Extensions
   - Or visit: https://marketplace.visualstudio.com/

### Option 4: Direct ZIP Distribution

**Create distributables:**

```bash
# Create ZIP with everything
zip -r trek-language-1.0.0.zip \
  trek.sample.trek \
  trek.schema.json \
  trek.tmLanguage.json \
  vscode-language-configuration.json \
  trek-language.json \
  package.json \
  README.md \
  LICENSE \
  *.md
```

**Users can:**
- Extract ZIP to a local folder
- Import in VS Code from VSIX if needed
- Access documentation locally

## Distribution Checklist

- [ ] All documentation files present
- [ ] Syntax highlighting grammar tested
- [ ] JSON schema validates correctly
- [ ] Sample program runs without errors
- [ ] VS Code extension installs without errors
- [ ] npm package installs and works
- [ ] README is comprehensive
- [ ] License file included
- [ ] Examples are clear and correct
- [ ] Installation instructions are accurate

## Updating Trek

When releasing updates:

1. **Update version** in `package.json`
2. **Update `CHANGELOG.md`** with changes
3. **Rebuild distribution:**
   ```bash
   npm run package  # or npm run package:win
   ```
4. **Test thoroughly** before releasing
5. **Publish to all channels:**
   ```bash
   npm publish
   vsce publish
   # Upload to GitHub Releases
   ```

## Making Trek Discoverable

### Documentation Website

Create at `trek-lang.org`:
- Language specification
- Interactive tutorial
- Playground (browser-based editor)
- Community links

### Social Media

- Tweet about Trek
- Post on dev.to
- Share on Reddit r/programming
- Add to language lists

### Package Registries

- Add to package registry websites
- Submit to language comparison sites
- List on awesome-lists

### Community

- Create Discord server
- Start GitHub Discussions
- Write blog posts
- Present at conferences

## Verifying Downloads

Users should be able to:

1. **Find Trek**
   - Google: "Trek programming language"
   - VS Code Extensions: Search "Trek"
   - npm: `npm search trek`

2. **Download**
   - GitHub: Download from releases
   - VS Code: Click install
   - npm: `npm install -g trek-format`

3. **Install**
   - VS Code: Auto-installs after download
   - npm: Works globally
   - Manual: INSTALL.md explains process

4. **Get Started**
   - Create `.trek` files with syntax highlighting
   - Follow QUICK_REFERENCE.md
   - Try EXAMPLES.md code

## Support Resources

Include in distribution:

- **README.md** - Overview and quick start
- **LANGUAGE_SPEC.md** - Complete syntax reference
- **QUICK_REFERENCE.md** - Cheat sheet
- **EXAMPLES.md** - Working code samples
- **INSTALL.md** - Platform-specific setup
- **CONTRIBUTING.md** - Contribution guidelines
- **CHANGELOG.md** - Version history

## Troubleshooting Common Issues

### Extension not showing syntax highlighting
- Ensure file extension is `.trek`
- Reload VS Code (Ctrl+R)
- Check VS Code version >= 1.60
- Reinstall extension from VSIX

### npm package installation fails
- Check Node.js version (>= 12)
- Clear npm cache: `npm cache clean --force`
- Try: `npm install -g trek-format@latest`

### Grammar not loading in editor
- Check TextMate grammar JSON validity
- Verify `trek.tmLanguage.json` exists
- Check `trek-language.json` has correct path

## Success Metrics

Track Trek adoption:
- GitHub stars and forks
- npm download statistics
- VS Code marketplace reviews
- community discussions
- GitHub issues

## Next Steps

After distribution:
1. Gather user feedback
2. Fix reported issues quickly
3. Plan future versions
4. Build community
5. Create official playground/IDE

---

For questions or issues, open a GitHub issue:
https://github.com/trek-lang/trek/issues
