import React from "react";
import { createContext,useState,useEffect } from "react";
import { ReactNode } from "react";
import { idText } from "typescript";

interface User {
    name: string;
  }

export const userContext=createContext("");


interface userProviderProps {
    children: ReactNode;
  }

export const UserProvider=({children}:userProviderProps)=>{
    
    const [user,setUser]=useState("");
    useEffect(()=>{
        fetchUserData();
    },[])

    const fetchUserData=async()=> {
        console.log('aaa')
        const response= await fetch('http://127.0.0.1:3000/current_user',{
          method:'Get',
          credentials:'include'
        })
        if (response.ok){
          const data=await response.json();
          console.log(data)
          console.log(`user:${data.user}`)
        //ログインしているかしていないかで分岐
        if (data.user&&data.user!=='null'){
          console.log(data.user.type)
          console.log('これからデータ')
          console.log(`データ：${data.user.id}`)
          setUser(data.user);
          console.log(`成功:${JSON.stringify(data.user)}`)
        }else{
          console.log('ログインしていません')
        }

        }else{
          setUser("");
          console.log('失敗')
        }
      }
    return(
        <userContext.Provider value={user}>
            {children}
        </userContext.Provider>
    )
}

