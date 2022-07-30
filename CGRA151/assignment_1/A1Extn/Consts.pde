class Consts {
    // The various consts for our program. I'd have prefered a struct but not sure how to get
    // what I was going for here so this is a gross implementation.
    int lineWidth;
    int chanceOfLine;
    int change;

    // Colour scheme based off the catppuccin colour scheme found here:
    // https://github.com/catppuccin/catppuccin.git
    color[] colors = {
        color(245, 224, 220),
        color(242, 205, 205),
        color(245, 194, 231),
        color(203, 166, 247),
        color(243, 139, 168),
        color(235, 160, 172),
        color(250, 179, 135),
        color(249, 226, 175),
        color(166, 227, 161),
        color(148, 226, 213),
        color(137, 220, 235),
        color(116, 199, 236),
        color(137, 180, 250),
        color(180, 190, 254)
    };

    Consts() {
        lineWidth = 3;
        chanceOfLine = 10;
        change = 3600;
    }
}