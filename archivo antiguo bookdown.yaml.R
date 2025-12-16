esto era _bookdown.yml

book_filename: "modelizacion-del-azar"
language:
  ui:
  chapter_name: "Tema "
delete_merged_file: true
rmd_files:
  - index.Rmd
- 00-portada.Rmd
- 01-introduccion.Rmd
- 02-probabilidad.Rmd
- 03-variables-aleatorias.Rmd
- 04-distribuciones-discretas.Rmd
- 05-distribuciones-continuas.Rmd
- 06-relacion-convergencia.Rmd
- 07-ejercicios.Rmd




esto era index.Rmd
---
  title: ""
author: ""
date: ""
site: bookdown::bookdown_site
output: bookdown::gitbook
---
  
  
anterior output


bookdown::gitbook:
  css: style.css        
split_by: chapter
number_sections: true
config:
  toc:
  collapse: none
before: |
  <li><strong>Modelización del azar</strong></li>
  download: ["pdf", "epub"]
search: true
toolbar:
  position: fixed
collapse: true
fontsettings:
  theme: white
family: sans
size: 2

bookdown::pdf_book:
  latex_engine: xelatex
keep_tex: true
number_sections: true

bookdown::epub_book:
  number_sections: true



