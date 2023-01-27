module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  theme: {
    screens: {
      sm: "640px",
      md: "768px",
      lg: "976px",
      xl: "1440px"
    },
    extend: {
      colors: {
        darkBlue: "hsl(212, 55%, 38%)",
        lightBlue: "hsl(212, 56%, 49%)",
        darkGray: "hsl(212, 11%, 30%)",
        lightGray: "hsl(218, 3%, 55%)",
        veryLightGray: "hsl(213, 6%, 62%)",
        darkGreen: "hsl(95, 68%, 42%)",
        lightGreen: "hsl(95, 68%, 49%)",
        veryLightGreen: "hsl(95, 68%, 55%)",
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
  ]
}