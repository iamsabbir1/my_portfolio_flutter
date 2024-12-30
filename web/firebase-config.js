// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
    apiKey: "AIzaSyAeO8tiu34BRk0pVYJV9jOzeop-VJ-zx0E",
    authDomain: "my-portfolio-bsce.firebaseapp.com",
    projectId: "my-portfolio-bsce",
    storageBucket: "my-portfolio-bsce.firebasestorage.app",
    messagingSenderId: "745990233054",
    appId: "1:745990233054:web:d3ff25bf0aaa881c229b4f",
    measurementId: "G-GE0SNMYTPG"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);

export { app, analytics };