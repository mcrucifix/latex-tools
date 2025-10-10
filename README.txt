Latex Template Project
=====================

This template uses the `latex-tools` submodule, which contains:
- mc.cls           : LaTeX class with formatting, boxes, math shortcuts
- makebib.py       : Python script to preprocess bibliography
- latexmkrc        : Compilation rules for latexmk

Setup instructions
------------------

1. Clone the template and initialize the submodule:

   git clone https://github.com/mcrucifix/latex-template.git MyCourse
   cd MyCourse
   git submodule update --init --recursive

2. Symlink latexmkrc from the submodule (recommended):

   ln -s tools/latexmkrc latexmkrc

   This allows you to compile with:
   latexmk -pdf -shell-escape template.tex

3. Edit your project metadata in config/project_name.conf
   - Change TITLE, AUTHOR, SCHOOL, DOCUMENTTYPE, ACADEMICYEAR, COURSECODE, COURSETITLE
   - Use \n in TITLE to add line breaks

4. Compile using LuaLaTeX (required for Lua metadata loader):

   latexmk -pdf -shell-escape template.tex
:
5. Add your chapters in separate .tex files and include them using:
   
   \chapter{Chapter Name}
   \include{Session_1_...}

Notes
-----
- mc.cls handles fonts, colors, tcolorboxes, math shortcuts
- makebib.py must be present in the submodule path
- All updates to latex-tools are propagated via git submodule


