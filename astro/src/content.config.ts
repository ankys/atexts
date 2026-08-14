
import { defineCollection } from 'astro:content';
import { docsSchema } from '@astrojs/starlight/schema';
import { glob } from 'astro/loaders';

export const collections = {
	docs: defineCollection({
		loader: glob({
			pattern: "**/*.typ",
			// base: "/src/content/docs"
			base: "/src/content/src"
		}),
		schema: docsSchema()
	}),
};
