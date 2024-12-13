import React from "react"
// import ButtonAppBar from "../components/ButtonAppBar"
import DataTable from "../components/Datatable"
import {useState,useEffect} from "react"

export const MyBooks=()=>{
    const [books,setBooks]=useState([]);
    useEffect(()=>{getBooks()},[])
    const getBooks=async()=>{
        const response=await fetch('http://127.0.0.1:3000/my_books',{
            method:'GET',
            credentials:'include'
        })
        if (response.ok){
            const data=await response.json()
            console.log(`書籍データ${JSON.stringify(data.books)}`)
            setBooks(data.books)
        }
        else{
            console.log('書籍の取得に失敗')
        }
    }
    console.log()
    return(
        <div>
            <h1>図書一覧</h1>
            <DataTable props={books} />
        </div>
    )
}