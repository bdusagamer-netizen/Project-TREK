# Installing Trek

## For VS Code Users

### Option 1: Download from Releases

1. Visit the [Trek releases page](https://github.com/trek-lang/trek/releases)
2. Download the latest `.vsix` extension file
3. Open VS Code
4. Go to Extensions (Ctrl+Shift+X)
5. Click the "..." menu and select "Install from VSIX..."
6. Select the downloaded `.vsix` file
7. Reload VS Code

### Option 2: Install from npm

```bash
npm install -g trek-format
```

## For Other Editors

### Sublime Text

1. Install the Trek syntax highlighting package through Package Control
2. Set file type to "Trek" when working with `.trek` files

### Vim/Neovim

Add syntax highlighting support by placing the Trek grammar file in your vim syntax directory:

```bash
cp trek.vim ~/.vim/syntax/
```

Add to your `.vimrc`:

```vim
au BufRead,BufNewFile *.trek set filetype=trek
```

## Command-Line Tools

### Trek Compiler

Download the Trek compiler for your platform:

- **Windows**: `trek-compiler-windows.exe`
- **macOS**: `trek-compiler-macos`
- **Linux**: `trek-compiler-linux`

```bash
trek build program.trek
trek run program.trek
trek check program.trek
```

## Development Setup

To contribute to Trek:

```bash
git clone https://github.com/trek-lang/trek.git
cd trek
npm install
npm run build
npm run test
```

## Troubleshooting

### Syntax highlighting not working

- Ensure the file extension is `.trek`
- Reload your editor
- Check that Trek language support is properly installed

### Command not found

- Ensure Trek is in your system PATH
- Try running with full path to executable
- On Mac/Linux, ensure file has execute permissions: `chmod +x trek-compiler`

## Getting Help

- Visit the [Trek documentation](https://trek-lang.org/docs)
- File issues on [GitHub Issues](https://github.com/trek-lang/trek/issues)
- Join the [Trek Community Discord](https://discord.gg/trek)
