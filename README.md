# clean-math-thesis

[![Build Typst Document](https://github.com/sebaseb98/clean-math-thesis/actions/workflows/build.yml/badge.svg)](https://github.com/sebaseb98/clean-math-thesis/actions/workflows/build.yml)
[![Repo](https://img.shields.io/badge/GitHub-repo-blue)](https://github.com/sebaseb98/clean-math-thesis)
[![License: MIT](https://img.shields.io/badge/License-MIT-success.svg)](https://opensource.org/licenses/MIT)

[Typst](https://typst.app/home/) thesis template for mathematical theses built for simple, efficient use and a clean look.
Of course, it can also be used for other subjects, but the following math-specific features are already contained in the template:

- theorems, lemmas, corollaries, proofs etc.  prepared using [great-theorems](https://typst.app/universe/package/great-theorems)
- equation settings
- pseudocode package [lovelace](https://typst.app/universe/package/lovelace) included.

Additionally, it has headers built with [hydra](https://typst.app/universe/package/hydra).

## Set-Up
The template is already filled with dummy data, to give users an impression how it looks like. The thesis is obtained by compiling `main.typ`.
To fit it to your needs

- edit the data in `meta.typ`
- (optional) change colors and appearance of the theorem environment in the `customization/`-folder.

When adding chapters remember to also add them into `main.typ`.

### Disclaimer 
This template was created after I finished my master's thesis.  
I do not guarantee that it will be accepted by any university, please clarify in advance if it fulfills all requirements. If not, this template might still be a good starting point.

### Feedback & Improvements
If you encounter problems, please open issues. In case you found useful extensions or improved anything I am also very happy to accept pull requests.
