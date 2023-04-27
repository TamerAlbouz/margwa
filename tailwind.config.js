/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.{js,jsx,ts,tsx}"],
  theme: {
    fontFamily: {
      serif: ["Nunito", "sans-serif"],
    },
    extend: {
      colors: {
        primary: "#212121",
        secondary: "#0F0F0F",
      },
    },
  },
  plugins: [],
};
