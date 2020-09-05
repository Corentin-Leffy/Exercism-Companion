Want to contribute? Great! First, read this page.

## Ways you can contribute

You can help this project in many ways, in addition to contributing code. For example, you can [report bugs](https://github.com/Corentin-Leffy/Exercism-Companion/issues).

## Before you contribute

Before you start working, you should get in touch with us first through the [GitHub issue tracker](https://github.com/Corentin-Leffy/Exercism-Companion/issues) with your idea so that I can help out and possibly guide you. Coordinating up front makes it much easier to avoid frustration later on.

All submissions require review.

## Getting the code

To work with the Dart code, you need to download and build the `master` branch.

## Starting a patch with git

Note: you can be in any branch when you run `git checkout -b`

```bash
git checkout -b <feature name>
<write code>
git commit
<write code...>
git commit
...
```

## Keeping your branch updated with origin/master

As you work, and before you send a patch for review, you should ensure your branch is merging cleanly to `origin/master`.

There are multiple ways to do this, but we generally recommend running:

```bash
git rebase -i origin/master
```

Note: you can run this command from any branch.

This command will fetch `origin/master`, rebase all your open branches.

Your local workflow may vary.

## Coding style

The source code follows the:

- [Dart style guide](https://dart.dev/guides/language/effective-dart/style)

You should familiarize yourself with those guidelines.
