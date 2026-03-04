# Trek Format Skeleton

This folder contains a minimal skeleton to start defining the Trek coding format.

- File extension: `.trek` (sample: `trek.sample.trek`)
- JSON Schema: `trek.schema.json` (minimal AST shape)
- Editor hints: `vscode-language-configuration.json` (simple brackets/comments)
- Package manifest: `package.json` (ready to publish to npm if desired)

How to use:

1. Copy this folder to your Trek format repository root.
2. Edit `trek.schema.json` to reflect the full format structure.
3. Add a VS Code grammar/semantic tokens or an official language server if you want IDE support.
4. Publish to npm so others can `npm install trek-format` or download the archive.

Quick publish (npm):

```bash
cd format-skeleton
npm publish --access public
```
