import React from "react";
import { createContext,useState,useEffect,useContext } from "react";
import { ReactNode } from "react";
import { idText } from "typescript";
import { FetchLoginState } from "../../api/FetchLoginState";


export const userContext=createContext("");


export const UserProvider=({children})=>{
    console.log('provi')
    const [user,setUser]=useState(false);
    const [loading,setLoading]=useState(true);

    useEffect(()=>{
        fetchUserData();
    },[])

    const fetchUserData=async()=>{
      const result=await FetchLoginState();
      if (result.state){
        console.log("ok")
        console.log(result.user_name["name"])
        setUser(result.user_name["name"])
        console.log(user)
      }else{
        console.log("ぶっぶー");
        setUser(false);
      }
      setLoading(false)
    }

    useEffect(() => {
  console.log(`ユーザの値が変わりました: ${user}`);
}, [user]);
    console.log(`ユーザの値：${user}`)
    return(
        <userContext.Provider value={{user,loading}}>
            {children}
        </userContext.Provider>
    )
}

