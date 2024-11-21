// import ButtonAppBar from "../components/ButtonAppBar"
import BasicTextFields from "../components/TextField"
import { BasicButtons } from "../components/BasicButton";
import Box from '@mui/material/Box';
import TextField from '@mui/material/TextField';
import React, { useState } from "react";

export const Addbooks=()=>{
    const [isbn,setIsbn]=useState("");

    const handleChange=(event:React.ChangeEvent<HTMLInputElement>)=>{
        setIsbn(event.target.value)
    }
    return(
        <div>
            {/* <ButtonAppBar/> */}
            <h1>図書登録</h1>
            <h2>ISBN:</h2>
            <Box
                component="form"
                sx={{ '& > :not(style)': { m: 1, width: '25ch' } }}
                noValidate
                autoComplete="off"
                >
                <TextField id="outlined-basic" label="Outlined" variant="outlined" value={isbn} onChange={handleChange} />
            </Box>
            <BasicButtons value={isbn} />
        </div>
    )
}