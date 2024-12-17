import React from "react";
import { Link } from "react-router-dom";
import TextField from '@mui/material/TextField';
import Autocomplete from '@mui/material/Autocomplete';
import top100Films from '../top100Films';
import { useEffect,useState } from "react";




export const Award=()=>{
    const [awards,setAwards]=useState([]);
    useEffect(()=>{getLiterary_awared()},[])

    const getLiterary_awared=async()=>{
        const response=await fetch('http://127.0.0.1:3000/awards',{
            method:'GET',
            credentials:'include'
        })
        console.log(`abcd${JSON.stringify(response)}`)
        console.log(response)
        if (response.ok){
            const data=await response.json()
            console.log(`hehehe${JSON.stringify(data)}`)
            console.log(data["awards"])
            setAwards(data["awards"])
            console.log('文学賞')
        }else{
            console.log('ead')
        }
    }

    const selection=awards.map(award=>({label:award.name}))

    
    

    return(
        <div>
            {/* <ButtonAppBar/> */}
            <h1>文学賞</h1>
            <Autocomplete
                disablePortal
                options={selection}
                sx={{ width: 300 }}
                renderInput={(params) => <TextField {...params} label="Movie" />}/>
            
           
        </div>
    )
}