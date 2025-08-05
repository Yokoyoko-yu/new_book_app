import * as React from 'react';
import Stack from '@mui/material/Stack';
import Button from '@mui/material/Button';
import {useEffect,useState,memo} from 'react';

const DeleteBookButtonComponent=({isbn,variant,children,onClick})=>{
    console.log("BookAddButton に渡された ISBN:", isbn);
    console.log("deletebookbuttonが呼び出された。")
    const DeleteBook=async()=>{
        try{
            const response=await fetch(`http://127.0.0.1:3000/user_books/${isbn}`,{
                method:'DELETE',
                credentials:'include'
            });
            const data=await response.json();
            console.log(data);
            onClick();
        }catch (error){
            console.error("通信エラー", error);
        }

    }
        

        return (
            <>
            <Button variant={variant} onClick={DeleteBook}>{children}</Button>
            </>
        )
    }

export const DeleteBookButton=memo(DeleteBookButtonComponent);