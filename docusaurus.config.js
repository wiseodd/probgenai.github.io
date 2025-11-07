import { themes as prismThemes } from "prism-react-renderer";

/** @type {import('@docusaurus/types').DocusaurusConfig} */
module.exports = {
  title: "CS9840: Probabilistic Generative AI",
  tagline: "CS9840: Probabilistic Generative AI",
  url: "https://probgenai.kristia.de/", // Replace it with your deployed Pages URL
  baseUrl: "/",
  onBrokenLinks: "throw",
  onBrokenMarkdownLinks: "warn",
  favicon: "img/favicon.svg",
  organizationName: "wiseodd",
  projectName: "CS9840: Probabilistic Generative AI",

  themeConfig: {
    navbar: {
      title: "CS9840: Probabilistic Generative AI",
      items: [],
    },

    footer: {
      style: "dark",
      links: [],
      copyright: `Copyright © ${new Date().getFullYear()} Agustinus Kristiadi`,
    },

    prism: {
      theme: prismThemes.oneLight,
      darkTheme: prismThemes.oneDark,
      additionalLanguages: [
        "markdown",
        "python",
        "bash",
        "json",
        "yaml",
        "diff",
        "latex",
      ],
      colorMode: {
        deafultMode: "light",
        disableSwitch: false,
        respectPrefersColorScheme: true,
      },
    },
  },

  presets: [
    [
      "@docusaurus/preset-classic",
      {
        docs: {
          sidebarPath: false,
          routeBasePath: "/", // Set the base path for the docs to be the root
        },

        blog: false, // Disable the blog feature completely

        theme: {
          customCss: require.resolve("./src/css/custom.css"),
        },
      },
    ],
  ],
};
