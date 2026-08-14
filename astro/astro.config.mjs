// @ts-check
import { defineConfig } from "astro/config";
import starlight from "@astrojs/starlight";
import { typst } from "astro-typst";

// https://astro.build/config
export default defineConfig({
	vite: {
		resolve: {
			preserveSymlinks: true
		}
	},
	integrations: [
		starlight({
			title: "数学テキスト",
			social: [{ icon: "github", label: "GitHub", href: "https://github.com/ankys/atexts" }],
			customCss: ["./src/custom.css"],
		}),
		typst({
			target: (id) => {
				console.debug(`Detecting ${id}`);
				return "html";
			},
			htmlMode: "text",
		}),
	],
});
