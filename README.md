![icon](https://github.com/jordan-melendez/jamwork/blob/master/icon.png "jamwork icon")

*Note: This package was previously called `jamhomework`.*

Handwritten notes and homework can get lost or ruined, which makes it hard to use them as a reference months or years after they were written.
LaTeX is a wonderful tool for typesetting documents—especially when a lot of math is involved—but none of the existing templates were up to my standards.
Hence, `JAMwork` was born!
`JAMwork` is a LaTeX Template for homework and note taking, with predefined macros for common academic needs.

For example, 
```latex
\documentclass{jamwork}

\author{My Name}
\email{myemail@school.edu}
\course{Intro to Proofs}
\assignment{Homework Set No.\ 1}
\date{September 1}

\begin{document}

\maketitle

...

```
will fill in your homework details, whereas
```latex
\begin{problem}[10 pts.]
Prove the Pythagorean theorem.
\end{problem}
```
will create a nicely formatted problem statement box.


## Installation

As described in the "Where to put files from packages" table [here](https://en.wikibooks.org/wiki/LaTeX/Installing_Extra_Packages), you need to place the `JAMwork` directory under `tex/latex/base`, which itself should be under `texmf/` or `texmf-local/`.
On my Mac with MacTeX, this involves first executing
```
cd ~/Library/texmf/tex/latex/base
```
in the terminal and then
```
git clone https://github.com/jordan-melendez/jamwork.git
```
This should let LaTeX should know about `JAMwork`.


## Contributing

Feel free to submit a pull request or raise an issue!

## What's with the name?

JAM happens to be my initials, and that's about all there is to it.
