return {
	tailwindCSS = {
		classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
		includeLanguages = {
			eelixir = "html-eex",
			eruby = "erb",
			htmlangular = "html",
			templ = "html",
		},
		lint = {
			cssConflict = "warning",
			invalidApply = "error",
			invalidConfigPath = "error",
			invalidScreen = "error",
			invalidTailwindDirective = "error",
			invalidVariant = "error",
			recommendedVariantOrder = "warning",
		},
		validate = true,
	},
}
