import * as React from 'react';
import Stack from '@mui/material/Stack';
import Button from '@mui/material/Button';
import {useEffect,useState} from 'react';

// ユーザが本の登録を行うボタン
export const BookAddButton=({isbn})=>{
    const [hasBook, setHasBook] = useState(null);

    const registBook=async ()=>{
        try{
            const response=await fetch(`http://127.0.0.1:3000/user_books?isbn=${isbn}`,{
                method:'POST',
                credentials:'include'
            });
            const data=await response.json();
            console.log(data);
            console.log(`いまのhasbook${hasBook}`)
            setHasBook(true);
        } catch (error){
            console.error("通信エラー", error);
        }
    }

    const deleteBook=async()=>{
        try{
            const response=await fetch(`http://127.0.0.1:3000/user_books/${isbn}`,{
                method:'DELETE',
                credentials:'include'
            });
            const data=await response.json();
            console.log(data);
            console.log(`いまのhasbook${hasBook}`)
            setHasBook(false);
        }catch (error){
            console.error("通信エラー", error);
        }
    }
    

    useEffect(() => {
    const checkBook = async () => {
      try {
        const response = await fetch(`http://127.0.0.1:3000/user_books/exists/${isbn}`,{
            method:'GET',
            credentials:'include'
        });
        const data = await response.json();
        console.log(data)
        setHasBook(data.has_book);
      } catch (error) {
        console.error("通信エラー", error);
      }
    };
    checkBook();
  }, []);
    return (
            <Stack spacing={2} direction="row">
            {/* <Button variant="text">Text</Button>
            <Button variant="contained">Contained</Button>
            <Button variant="outlined">Outlined</Button> */}
            
            {hasBook==true ? <Button variant="outlined" onClick={deleteBook}>所持済み</Button> : <Button variant="contained" onClick={registBook}>登録する</Button>}
            </Stack>
            
        );
}