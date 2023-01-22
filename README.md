## Screenshots
![image](https://i.ibb.co/LCG97p0/nvim-screenshot.png)

## Requirements
* Neovim v0.7.2
* Kitty

## Usage
   ```shell
   cd ~/.config
   git clone https://github.com/orklann/nvim.git
   # Copy Kitty terminal configuration
   cp -r ~/.config/nvim/kitty/ ~/.config/
   ```
   
    * First time running nvim, there are errors
    * Run :PlugInstall to install nvim-cmp and all dependences
    * Restart nvim

## Steps to use cscope.nvim

1. Install cscope
    ```shell
    sudo apt install cscope
    ```

2. Install pynvim 
    ```shell
    python3 -m pip install --user --upgrade pynvim
    ```

3. See commands and other help in cscope.nvim project

   https://github.com/mfulz/cscope.nvim
