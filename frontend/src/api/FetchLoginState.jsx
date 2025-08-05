// ログイン状態を確認してログインしていたら名前を、

export const FetchLoginState=async()=>{
    console.log('fetchloginstate')
    const response=await fetch("http://127.0.0.1:3000/current_user",{
        method:"GET",
        credentials:"include"
    })
    if (response.ok){
        console.log("ログインしています。")
        const data=await response.json();
        const user_name=data["user_name"]
        console.log(user_name)
        console.log(data)
        return {state:true,user_name:user_name}
    }else{
        console.log("ログインしていません。")
        const user_name=null
        return {state:false,user_name:null}
    }
}