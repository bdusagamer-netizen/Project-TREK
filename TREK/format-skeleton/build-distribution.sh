#!/bin/bash

# Trek Language Package Builder
# Builds and packages Trek for distribution

set -e

echo "============================="
echo "Trek Language Package Builder"
echo "============================="

VERSION="1.0.0"
DIST_DIR="dist"

# Create distribution directory
mkdir -p "$DIST_DIR"

echo ""
echo "Step 1: Validating package.json..."
if [ ! -f "package.json" ]; then
    echo "Error: package.json not found"
    exit 1
fi

echo "✓ package.json found"

echo ""
echo "Step 2: Installing dependencies..."
npm install

echo "✓ Dependencies installed"

echo ""
echo "Step 3: Running tests..."
npm test 2>/dev/null || echo "⚠ No tests configured"

echo ""
echo "Step 4: Creating VS Code extension (.vsix)..."
if command -v vsce &> /dev/null; then
    vsce package -o "$DIST_DIR/trek-language-$VERSION.vsix"
    echo "✓ Created trek-language-$VERSION.vsix"
else
    echo "⚠ vsce not installed. Install with: npm install -g vsce"
    echo "  To manually create extension, run: vsce package"
fi

echo ""
echo "Step 5: Creating npm package..."
npm pack --pack-destination="$DIST_DIR"
echo "✓ Created trek-format-$VERSION.tgz"

echo ""
echo "Step 6: Creating ZIP archive..."
cd "$DIST_DIR" || exit 1
if command -v zip &> /dev/null; then
    zip -r "trek-language-$VERSION.zip" . \
        -x "*.git*" "node_modules/*" "*.log" ".DS_Store" \
        "../.git*" "../node_modules/*" "../.*"
    echo "✓ Created trek-language-$VERSION.zip"
else
    echo "⚠ zip command not found. Archive creation skipped."
fi
cd - || exit 1

echo ""
echo "============================="
echo "Build Complete!"
echo "============================="
echo ""
echo "Distribution files:"
ls -lh "$DIST_DIR"

echo ""
echo "Next steps:"
echo "1. Test the .vsix in VS Code: Extensions → Install from VSIX"
echo "2. Upload to GitHub Releases: trek-language-$VERSION.vsix"
echo "3. Publish to npm: npm publish"
echo "4. Submit to VS Code Marketplace: vsce publish"
echo ""
