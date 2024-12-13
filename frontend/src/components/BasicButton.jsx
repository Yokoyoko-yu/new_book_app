import * as React from 'react';
import Stack from '@mui/material/Stack';
import Button from '@mui/material/Button';
import { useState } from 'react';
import { replace } from 'react-router-dom';


export const BasicButtons=(props)=> {
  const [imagesrc,Setimagesrc]=useState("")
  const [imgState,SetimgState]=useState(false)
  const [bookinfo,Setbookinfo]=useState({})
  const {value}=props
  const searchBook=async(str)=>{
    const isbn=str.replace(/-/g,'')
    console.log(`isbn:${isbn}`)
    //画像の取得
    try{
      const response= await fetch(`https://ndlsearch.ndl.go.jp/thumbnail/${isbn}.jpg`,{
              method:'get',
              mode: 'no-cors'
      })
      Setimagesrc(`https://ndlsearch.ndl.go.jp/thumbnail/${isbn}.jpg`)
      SetimgState(true)
    }catch(err){
      console.log(`エラー内容：${err}`)
      alert('書籍の検索に失敗しました')
      SetimgState(false)
    }
    //書籍情報の取得
    try{
      const book=await fetch(`https://api.openbd.jp/v1/get?isbn=${isbn}`)
      if (!book.ok) {
        throw new Error(`HTTP error! status: ${book.status}`);
    }
      console.log(book)
      const info=await book.json()
      console.log(info)
      console.log(`タイトル：${info[0]['summary'].title}`)
      console.log(`著者:${info[0]['summary'].author}`)
      console.log(`isbn:${isbn}`)
      console.log(`画像のURL:${imagesrc}`)
      Setbookinfo({
        title:info[0]['summary'].title,
        author:info[0]['summary'].author,
        isbn:isbn,
        image:`https://api.openbd.jp/v1/get?isbn=${isbn}`
      })
      console.log(`情報${JSON.stringify(bookinfo)}`)
    }catch(err){
      alert('書籍の検索に失敗しました...')
      Setbookinfo({})
      console.log(err)
    }
  }

  const add_book=async()=>{
    const response=await fetch('http://127.0.0.1:3000/my_books',{
      method:'Post',
      credentials:'include',
      headers: {
        'Content-Type': 'application/json',  // JSON形式で送信することを指定
      },
      body:JSON.stringify({
        my_book:bookinfo
      })
    })
    if(response.ok){
      alert('登録に成功しました')
      SetimgState(false)
      Setimagesrc("")
    }else{
      alert('登録に失敗しました')

    }
  }
  return (
    <div>
    <Stack spacing={2} direction="row">
      <Button variant="contained" onClick={()=>{searchBook(value)}}>検索する</Button>
    </Stack>
    {imagesrc && <img src={imagesrc} alt="Book Thumbnail" />}
    {imgState&&<Button variant='contained' onClick={add_book}>登録する</Button>}
    </div>
  );
}
