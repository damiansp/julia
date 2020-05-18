In the Julia REPL:
> using Pkg
> Pkg.add("PkgTemplates")

> template = Template(; license="MIT", user="jdoe")
> generate(template, "Calculator")

Creates package, "Calculator" with dir structure:
```
Calulator/
  LICENSE
  Manifest.toml
  Project.toml
  README.md
  src/
    Calculator.jl
  test/
    runtests.jl
```

...will be created at ~/.julia/dev/Calculator
