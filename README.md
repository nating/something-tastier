# something-tastier
🍱 The development of the language 'Tastier'. 👅

## Description
Tastier is a programming language who's grammar can be seen here in a screenshot of the current tastier.html:

<img src="https://github.com/nating/something-tastier/blob/master/assets/tastier-grammar.png" width="800">

This grammar presented in the tastier.html maps to the code written in C# in the Tastier.ATG file.

The Tastier.ATG file calls functions from SymTab.cs & CodeGen.cs. The sample programme to demonstrate the compilation of Tastier is in the Tastier.TAS file.  
When the project is made and built, the CodeGen.cs methods are called by the Tastier.ATG to generate ARM Assembly language code in the Tastier.s file for the Tastier.TAS program.

## Compilation
Running
`make && build`
will compile the Tastier program in Tastier.TAS into ARM Assembly in Tastier.s.

If the code in Tastier.TAS does not comply with the Tastier grammar, or there are errors, e.g. wrong parameter types, the program will not compile and the errors will be written to the console.