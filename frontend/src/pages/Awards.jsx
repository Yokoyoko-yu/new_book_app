import React from "react";
import { Link } from "react-router-dom";
import TextField from '@mui/material/TextField';
import Autocomplete from '@mui/material/Autocomplete';
import top100Films from '../top100Films';
import { useEffect,useState } from "react";
import ColumnMenuGrid from "../components/AwardTable";
import {AddNewColumnMenuGrid} from "../components/AwardTable";
import { useLocation, useNavigate } from 'react-router-dom';
import { Navigate } from "react-router-dom";
import { useMoveLoginPage } from "../hooks/useMoveLoginPage";


export const Award=()=>{
    useMoveLoginPage();
    const navigate = useNavigate();
    const useQuery = () => new URLSearchParams(useLocation().search);
    // 賞の種類をすべて保持
    const [awards,setAwards]=useState([]);
    //選択している賞
    const [prize,setPrize]=useState({id:1});
    const [awardsData,setAwardsData]=useState([]);
    useEffect(()=>{getLiterary_awared()},[]);
    useEffect(()=>{getAwardList()},[prize]);

    // 賞の種類を選択
    const getLiterary_awared=async()=>{
        const response=await fetch('http://127.0.0.1:3000/awards',{
            method:'GET',
            credentials:'include'
        })
        console.log(`abcd${JSON.stringify(response)}`)
        if (response.ok){
            const data=await response.json()
            console.log(`hehehe${JSON.stringify(data)}`)
            setAwards(data["awards"])
        }else{
            console.log("文学賞の種類の取得に失敗")
        }
    }

    const selection=awards.map(award=>({label:award.name,id:award.id}))

    // 選択されたらこの関数を実行
    const handleAwardChange = (event, newValue) => {
        if (newValue) {
            setPrize(newValue);
            navigate(`?award_id=${newValue.id}`);
            console.log('セット成功')
            console.log(`プライズの値：${prize}`)
            console.log(prize)
            console.log(`アワードの値${awards}`)
            console.log(awards)
            
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
                sx={{ width: 300,marginBottom:"5px" }}
                onChange={handleAwardChange}
                renderInput={(params) => <TextField {...params} label="prize" />}/>
            
            <AddNewColumnMenuGrid data={awardsData}></AddNewColumnMenuGrid>
        </div>
    )
}