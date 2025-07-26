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
// import ButtonAppBar from './components/ButtonAppBar';
import { Layout } from './components/Layout';
import { UserProvider } from './components/Provider/userProbider';
import {BookDetail} from './pages/BookDetail';

export const App=()=>{
  // const fetchUserData=async()=> {
  //   console.log('aaa')
  //   const response= await fetch('http://127.0.0.1:3000/current_user',{
  //     method:'Get',
  //     credentials:'include'
  //   })
  //   if(response.ok){
  //     const data=await response.json();
  //     console.log(`ユーザデータ：${data}`)
  //   }else{
  //     console.log('失敗')
  //   }
  // }

  return(
    <div>
    <Layout/>
    <Router>
    <Routes>
    <Route path='/'  element={<Home/>}/>
    <Route path='/signin' element={<SignIn/>}/>
    <Route path='/signup' element={<Signup/>}/>
      <Route path='/addbooks'  element={<UserProvider><Addbooks/></UserProvider>}/>
      <Route path='/mybooks' element={<UserProvider><MyBooks/></UserProvider>}/>
      <Route path='/award' element={<UserProvider><Award/></UserProvider>}/>
    <Route path='/award_book_contents/:id' element={<BookDetail/>} />
    </Routes>

  </Router>

  </div>
  )
}

export default App;