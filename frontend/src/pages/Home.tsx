import React from "react";
// import ButtonAppBar from "../components/ButtonAppBar";
import { Link } from '@mui/material';

export const Home=()=>{
    return(
        <div>
        {/* <ButtonAppBar/> */}
        <h1>home</h1>
        <Link href="/signin" underline="hover" >{"サインインする"}</Link>
        <Link href="/signup" underline="hover">{"サインアップする"}</Link>
        </div>
    )
}