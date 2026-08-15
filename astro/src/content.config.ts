
import { defineCollection } from 'astro:content';
import { docsSchema } from '@astrojs/starlight/schema';
import { glob } from 'astro/loaders';

export const collections = {
	docs: defineCollection({
		loader: glob({
			base: "./src/content/docs",
			// pattern: "(index.typ|(cal1t)/*.typ)",
			pattern: "**/*.typ",
		}),
		schema: docsSchema()
	}),
};
