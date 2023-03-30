// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
    apiKey: "AIzaSyCXHh5ZxPGoQqjEtC8crqUiE84P6orj5fg",
    authDomain: "margwa-manga.firebaseapp.com",
    projectId: "margwa-manga",
    storageBucket: "margwa-manga.appspot.com",
    messagingSenderId: "842824867919",
    appId: "1:842824867919:web:e2478c97b0d13748d48a3a",
    measurementId: "G-NGY3DM35J1"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);