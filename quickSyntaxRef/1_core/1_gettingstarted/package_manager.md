In Julia REPL:

`> ]` enter package mgr
`status` (like pip list)
`update` (all packages to most recent)
`add myPackage` (download, install)
`add myPackage#branchName`
`add myPackage#vX.Y.Z`
`free myPackage` (returns package to latest release)
`rm myPackage`
`add git@github.com:userName/pkgName.jl.git` (non-registered packages)


In source code
`using mypackage` (python: from mypackage import *)
> pfunc()
`import mypackage` (python: import mypackage)
> mypackage.pfunc()
`const mp = mypackage`
> mp.pfunc()
`import mypackage:pfunc`
`include("MyFile.jl")` (like pasting the file into current)
