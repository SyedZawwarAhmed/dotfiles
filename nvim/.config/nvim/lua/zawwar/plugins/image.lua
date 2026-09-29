-- Render images in the terminal via the kitty graphics protocol (Ghostty supports it).
-- Opening a .png/.jpg/.gif/.webp/.svg/.pdf shows the image; markdown images render inline.
return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		image = {
			enabled = true,
			doc = {
				inline = true,
				float = true,
			},
		},
	},
	keys = {
		{
			"<leader>ih",
			function()
				Snacks.image.hover()
			end,
			desc = "Show image under cursor",
		},
	},
}
