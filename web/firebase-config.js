// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
import { getAuth } from "firebase/auth";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyBCDSfkYF50lzMjn1mFaqp-KTk7Cl_TX1A",
  authDomain: "bestfriend-189af.firebaseapp.com",
  projectId: "bestfriend-189af",
  storageBucket: "bestfriend-189af.appspot.com",
  messagingSenderId: "138537994298",
  appId: "1:138537994298:web:49538ad74022df9f100d03",
  measurementId: "G-XW0H3NNYT9"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
const auth = getAuth(app);
