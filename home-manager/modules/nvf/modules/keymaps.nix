{
  programs.nvf.settings.vim.keymaps = [
    {
      key    = "J";
      mode   = "v";
      silent = true;
      action = ":m '>+1<cr>gv=gv";
      desc   = "Move selected lines down";
    }
    {
      key    = "K";
      mode   = "v";
      silent = true;
      action = ":m '<-2<CR>gv=gv";
      desc   = "Move selected lines up";
    }
    {
      key    = "L";
      mode   = "v";
      action = ">gv";
      desc   = "Indent selected lines right";
    }
    {
      key    = "H";
      mode   = "v";
      action = "<gv";
      desc   = "Indent selected lines left";
    }
    {
      key    = "<C-h>";
      mode   = "n";
      action = "<C-w>h";
      desc   = "Focus left window";
    }
    {
      key    = "<C-j>";
      mode   = "n";
      action = "<C-w>j";
      desc   = "Focus lower window";
    }
    {
      key    = "<C-k>";
      mode   = "n";
      action = "<C-w>k";
      desc   = "Focus upper window";
    }
    {
      key    = "<C-l>";
      mode   = "n";
      action = "<C-w>l";
      desc   = "Focus right window";
    }
    {
      key    = "<leader>y";
      mode   = "v";
      action = "\"+y";
      desc   = "Yank to system clipboard";
    }
    {
      key    = "<leader>p";
      mode   = "n";
      action = "\"+p";
      desc   = "Paste from system clipboard";
    }
    {
      key    = "<leader>n";
      mode   = "n";
      action = ":nohlsearch<CR>";
      desc   = "Clear search highlight";
    }
    {
      key    = "<leader>a";
      mode   = "n";
      action = "ggVG";
      desc   = "Select all text";
    }
    {
      key    = "<leader>w";
      mode   = "n";
      action = ":w<CR>";
      desc   = "Save file";
    }
    {
      key    = "<leader>q";
      mode   = "n";
      action = ":q<CR>";
      desc   = "Quit window";
    }
    {
      key    = "<leader>Q";
      mode   = "n";
      action = ":q!<CR>";
      desc   = "Quit window without save";
    }
    {
      key    = "<leader>x";
      mode   = "n";
      action = ":x<CR>";
      desc   = "Save and quit";
    }
    {
      key    = "<leader>s";
      mode   = "x";
      action = ":sort<CR>";
      desc   = "Sort by alphabet";
    }
    {
      key    = "<leader>S";
      mode   = "x";
      action = ":sort!<CR>";
      desc   = "Sort by alphabet (reverse)";
    }
    {
      key    = "<leader>l";
      mode   = "x";
      action = ":'<,'>!awk '{ print length, $0 }' | sort -n | cut -d\" \" -f2-<CR>";
      desc   = "Sort by line length";
    }
    {
      key    = "<leader>L";
      mode   = "x";
      action = ":'<,'>!awk '{ print length, $0 }' | sort -nr | cut -d\" \" -f2-<CR>";
      desc   = "Sort by line lenght (reverse)";
    }
    {
      key    = "<Tab>";
      mode   = "n";
      action = ":tabnext <CR>";
      desc   = "Select next tab";
    }
    {
      key    = "<C-Tab>";
      mode   = "n";
      action = ":tabNext <CR>";
      desc   = "Select previous tab";
    }
    {
      key    = "<leader><Tab>";
      mode   = "n";
      action = ":tabnew <CR>";
      desc   = "Open new tab";
    }
    {
      key    = "<leader>c";
      mode   = "n";
      action = ":tabclose <CR>";
      desc   = "Close tab";
    }
    {
      key    = "ga";
      mode   = "x";
      action = ":EasyAlign<CR>=<CR>";  
      desc   = "Align by = ";
    }
    {
      key    = "<leader>h";
      mode   = "n";
      action = ":Gitsigns preview_hunk<CR>";
      desc   = "Preview changes [Git]";
    }
    {
      key    = "<leader>cf";
      mode   = "n";
      action = ":Git commit %<CR>";
      desc   = "Commit current file [Git]";
    }
    {
      key    = "<leader>gd";
      mode   = "n";
      action = ":Git add %<CR>";
      desc   = "Add current file [Git]";
    }
    {
      key    = "<leader>ff";
      mode   = "n";
      action = ":Telescope file_browser <CR>";
      desc   = "Find file [File_browser]"; 
    }
    {
      key    = "<A-j>";
      mode   = "n";
      action = ":resize -2 <CR>";
      desc   = "Resize Up"; 
    }
    {
      key    = "<A-k>";
      mode   = "n";
      action = ":resize +2 <CR>";
      desc   = "Resize Down"; 
    }
    {
      key    = "<A-h>";
      mode   = "n";
      action = ":vertical resize +2 <CR>";
      desc   = "Resize Left"; 
    }
    {
      key    = "<A-l>";
      mode   = "n";
      action = ":vertical resize -2 <CR>";
      desc   = "Resize Right"; 
    }
    {
      key     = "<Esc>";
      mode    = "t";
      action  = "<C-\\><C-n>";
      desc    = "Unfocus terminal";
      silent  = true;
      noremap = true;
    }
    {
      key = "<leader>m";
      mode = "n";
      action = ":make<CR>:cwindow<CR>";
      desc = "Compile current c file";
      silent = true;
    }
  ];
}
