// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
import { getAuth } from 'firebase/auth';
import { getFirestore } from "firebase/firestore";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyAEpsKLi6PAzxN6rUntzyDRQ2tP9rJ2-DQ",
  authDomain: "kissan-map.firebaseapp.com",
  projectId: "kissan-map",
  storageBucket: "kissan-map.firebasestorage.app",
  messagingSenderId: "173069552298",
  appId: "1:173069552298:web:60febcd1d8b4d7e7aa9ed3",
  measurementId: "G-9P4ZPSNVCV"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
const auth = getAuth(app);

export { auth };
export const db = getFirestore(app);