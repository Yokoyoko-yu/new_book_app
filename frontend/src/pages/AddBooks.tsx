
import BasicTextFields from "../components/TextField"
import { BasicButtons } from "../components/BasicButton";
import Box from '@mui/material/Box';
import TextField from '@mui/material/TextField';
import React, { useState } from "react";
import { useMoveLoginPage } from "../hooks/useMoveLoginPage";

export const Addbooks=()=>{
    const [isbn,setIsbn]=useState("");
    useMoveLoginPage();
    const handleChange=(event:React.ChangeEvent<HTMLInputElement>)=>{
        setIsbn(event.target.value)
    }
    return(
        <div >
            <h1>図書登録</h1>
            <Box
                component="form"
                sx={{
                    display: "flex",
                    flexDirection: "column",
                    alignItems: "center",
                    justifyContent: "center",
                    '& > :not(style)': { m: 1, width: '25ch' }
                }}
                noValidate
                autoComplete="off"
                >
                <TextField id="outlined-basic" label="ISBN" variant="outlined" value={isbn} onChange={handleChange} />
            </Box>
            <BasicButtons value={isbn} style={{ display: "flex", justifyContent: "center", marginTop: "16px" }}/>
        </div>
    )
}