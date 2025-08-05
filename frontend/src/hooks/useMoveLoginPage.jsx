import { userContext } from "../components/Provider/userProbider"
import { useContext,useEffect } from 'react';
import { useNavigate } from 'react-router-dom';


//ログインしてなかったらログイン画面に遷移 
export const useMoveLoginPage=()=>{
    console.log('MoveloginPage')
    const {user,loading}=useContext(userContext);
    const navigate=useNavigate();
    console.log(user)
    useEffect(()=>{
        if (!loading){
        if (!user){
            console.log(`ユーザ名${user.name}`)
            alert("ログインしてください");
            navigate("/")
        }
    }
    },[user,loading])
}