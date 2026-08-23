return {
	"mistricky/codesnap.nvim",
	build = "make",
	cmd = { "CodeSnap", "CodeSnapSave", "CodeSnapHighlight" },
	opts = {
		save_path = "~/Pictures/CodeSnap",
		has_breadcrumbs = true,
		bg_theme = "bamboo",
		watermark = "",
	},
}
