from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import *

class TokyoNight(ColorScheme):
    progress_bar_color = 33  # Blue

    def use(self, context):
        fg, bg, attr = default_colors

        tokyo_fg = 145  # light gray (#c0caf5)
        tokyo_bg = 234  # dark bg (#1a1b26)
        tokyo_blue = 33  # bright blue (#89b4fa)
        tokyo_red = 160  # red (#f7768e)
        tokyo_green = 64  # green (#9ece6a)
        tokyo_yellow = 214  # yellow (#e0af68)
        tokyo_purple = 141  # purple (#bb9af7)
        tokyo_comment = 244  # gray for comments (#565f89)

        fg = tokyo_fg
        bg = tokyo_bg
        attr = 0

        if context.reset:
            return tokyo_fg, tokyo_bg, 0

        if context.selected:
            attr |= reverse
            fg = tokyo_bg
            bg = tokyo_blue

        if context.inactive_pane:
            fg = tokyo_comment
            bg = tokyo_bg

        if context.empty or context.error:
            fg = tokyo_red
            bg = tokyo_bg

        if context.border:
            fg = tokyo_blue

        if context.media:
            fg = tokyo_purple

        if context.container:
            fg = tokyo_yellow

        if context.directory:
            fg = tokyo_blue
            attr |= bold

        if context.executable and not context.media:
            fg = tokyo_green
            attr |= bold

        if context.socket:
            fg = tokyo_yellow
            attr |= bold

        if context.link:
            fg = tokyo_purple
            attr |= underline

        if context.tag_marker and context.selected:
            attr |= bold

        if context.cut or context.copied:
            fg = tokyo_bg
            bg = tokyo_yellow
            attr |= bold

        if context.main_column:
            if context.selected:
                attr |= bold

        if context.marked:
            attr |= bold | reverse
            fg = tokyo_red

        if context.badinfo:
            if attr & reverse:
                bg = tokyo_red
            else:
                fg = tokyo_red

        return fg, bg, attr
