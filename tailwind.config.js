/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.{html,jsp,js}"],
  theme: {
    extend: {
      colors: {
        transparent: 'transparent',
        current: 'currentColor',
        'verde': '#80BF96',
        'verde-claro': '#B8D9BA',
        'verde-palido': '#E1F2D5',
        'verde-musgo': '#A4BF88',
        'blanco-hueso': '#f2f2f2',
      }
    },
  },
  plugins: [],
}

