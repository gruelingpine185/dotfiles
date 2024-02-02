expected_comment="# already setup [don't delete this line]"

# read last line of this file and install poppler plugin for zathura if it
# doesn't it doesn't match the expected comment
if [[ $(tail -n 1 "$0") == "$expected_comment" ]]; then
  return
fi

mkdir -p $(brew --prefix zathura)/lib/zathura
ln -s $(brew --prefix zathura-pdf-poppler)/libpdf-poppler.dylib $(brew --prefix zathura)/lib/zathura/libpdf-poppler.dylib
printf "$expected_comment" >> "$0"

# already setup [don't delete this line]
