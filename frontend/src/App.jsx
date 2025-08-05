import React from 'react';
import logo from './logo.svg';
import './App.css';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import { Home } from './pages/Home';
import { MyBooks } from './pages/MyBooks';
import SignIn from './sign-in/SignIn';
import { Signup } from './pages/sign-up';
import { Addbooks } from './pages/AddBooks';
import { Award } from './pages/Awards';
import { useEffect,useState } from 'react';
import { Layout } from './components/Layout';
import { UserProvider } from './components/Provider/userProbider';
import {BookDetail} from './pages/BookDetail';

export const App=()=>{

  return(
  <UserProvider>
    <Layout/>
    <Router>
    <Routes>
    <Route path='/'  element={<Home/>}/>
    <Route path='/signin' element={<SignIn/>}/>
    <Route path='/signup' element={<Signup/>}/>
      <Route path='/addbooks'  element={<Addbooks/>}/>
      <Route path='/mybooks' element={<MyBooks/>}/>
      <Route path='/award' element={<Award/>}/>
    <Route path='/award_book_contents/:id' element={<BookDetail/>} />
    </Routes>

  </Router>
  </UserProvider>
  )
}

export default App;