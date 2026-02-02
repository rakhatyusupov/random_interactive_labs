module.exports = {
  content: [
    "./app/views/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/assets/stylesheets/**/*.css",
    "./app/javascript/**/*.js",
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ["Graphik LCG", "system-ui", "sans-serif"],
        mono: ["Reddit Mono", "monospace"],
        grid: ["Gridlite PE", "monospace"],
      },
    },
  },
  plugins: [],
};
