import React from "react";
import { Link } from "react-router-dom";
import TextField from '@mui/material/TextField';
import Autocomplete from '@mui/material/Autocomplete';
import top100Films from '../top100Films';
import { useEffect,useState } from "react";
import ColumnMenuGrid from "../components/AwardTable";
import {AddNewColumnMenuGrid} from "../components/AwardTable";


export const Award=()=>{
    const [awards,setAwards]=useState([]);
    const [prize,setPrize]=useState({id:1});
    const [awardsData,setAwardsData]=useState([]);
    useEffect(()=>{getLiterary_awared()},[]);
    useEffect(()=>{getAwardList()},[prize]);

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

    const selection=awards.map(award=>({label:award.name,id:award.id}))

    const handleAwardChange = (event, newValue) => {

        if (newValue) {
            setPrize(newValue);
            console.log('セット成功')
        }
        console.log("賞のid:",prize)
    };


    const getAwardList=async()=>{
        if (!prize?.id) {
            console.warn("prize.id が存在しないため、API リクエストをスキップします");
            return;
        }
    
       
        try {
            const response = await fetch(`http://127.0.0.1:3000/award_grants/search?award_id=${prize.id}`, {
                method: 'GET',
                credentials: 'include'
            });
    
            console.log("表データ", response[0]);
    
            const data = await response.json();  // JSONデータを取得
            console.log("aaa",data[0])
            setAwardsData(data);
            console.log("表データ (JSON本体)",data);
        } catch (error) {
            console.error("データの取得に失敗しました:", error);
        }
    };
    
    
    

    return(
        <div>
            {/* <ButtonAppBar/> */}
            <h1>文学賞の世界</h1>
            <Autocomplete
                disablePortal
                options={selection}
                sx={{ width: 300 }}
                onChange={handleAwardChange}
                renderInput={(params) => <TextField {...params} label="prize" />}/>
            {/* <div>{JSON.stringify(prize)}</div> */}
            
            <AddNewColumnMenuGrid data={awardsData}></AddNewColumnMenuGrid>
        </div>
    )
}