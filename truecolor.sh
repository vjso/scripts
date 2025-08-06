#check if the terminal supports true color, required by neovim
awk -v term_cols=$(tput cols) 'BEGIN{
    s = "/\\/\\/\\/\\/\\"; s = s s s s s s s s;
    max = term_cols - 1;

    for (colnum = 0; colnum < term_cols; colnum++) {
        r = 255 - (colnum * 255 / max);
        g = (colnum * 510 / max);
        b = (colnum * 255 / max);
        if (g > 255) g = 510 - g;

        printf "\033[48;2;%d;%d;%dm", r, g, b;
        printf "\033[38;2;%d;%d;%dm", 255 - r, 255 - g, 255 - b;
        printf "%s", substr(s, (colnum % length(s)) + 1, 1);
    }

    printf "\033[0m\n";
}'
