" init setup inspiration from: https://afnan.io/2018-04-12/my-neovim-development-setup/

for f in split(glob('~/.config/nvim/config/*.vim'), '\n')
  exe 'source' f
endfor

for f in split(glob('~/.config/nvim/config/plugins/*.vim'), '\n')
  exe 'source' f
endfor
