// @ts-check
import { defineConfig } from "astro/config";
import starlight from "@astrojs/starlight";
import { typst } from "astro-typst";

// https://astro.build/config
export default defineConfig({
	// build: {
	// 	format: "file"
	// },
	vite: {
		resolve: {
			preserveSymlinks: true
		}
	},
	integrations: [
		starlight({
			title: "数学テキスト",
			locales: { root: { label: "日本語", lang: "ja", }, },
			social: [{ icon: "github", label: "GitHub", href: "https://github.com/ankys/atexts" }],
			customCss: ["./src/custom.css"],
			sidebar: [
				{ label: "序文", slug: "preface", },
				{ label: "微分積分学１", items: [{ autogenerate: { directory: "cal1t" } }], },
				{ label: "微分積分学２", items: [{ autogenerate: { directory: "cal2t" } }], },
				{ label: "微分積分学３", items: [{ autogenerate: { directory: "cal3t" } }], },
				{ label: "線形代数学１", items: [{ autogenerate: { directory: "lin1t" } }], },
			],
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
