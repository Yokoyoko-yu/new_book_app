import React from "react";
// import ButtonAppBar from "../components/ButtonAppBar";
import { useParams } from 'react-router-dom';
import { useEffect,useState } from "react"; 
import ActionAreaCard from "../components/BookCard";
import Box from '@mui/material/Box';


export const BookDetail=()=>{
    const { id } = useParams(); // URLパラメータからidを取得
    const [awardData, setAwardData] = useState(null);

    
    useEffect(()=>{
    fetch(`http://127.0.0.1:3000/award_titles/${id}`)
      .then((res) => {
        if (!res.ok) {
          throw new Error('サーバーエラー');
        }
        return res.json();
      })
      .then((data) => {
        setAwardData(data);
        console.log("aaaa",data);
      })
      .catch((err) => {
        console.error(err);
        setError('データの取得に失敗しました');
      });
      console.log("本：",awardData)
    },[id])

  return (
    <div>
      <h1>タイトルを収録している本</h1>
      <Box sx={{ display: 'flex', flexWrap: 'wrap',justifyContent: 'center', gap: 10, }}>
        {awardData && awardData.map((bookinfo) => (
          // bookinfoごとにカードを作成
          <ActionAreaCard key={bookinfo.isbn}  isbn={bookinfo.isbn} author={bookinfo.author} title={bookinfo.title} publisher={bookinfo.publisher}></ActionAreaCard>
        ))}
      </Box>
      {/* <div>{awardData}</div> */}
    </div>
  );

}