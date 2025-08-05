import * as React from 'react';
import AppBar from '@mui/material/AppBar';
import Box from '@mui/material/Box';
import Toolbar from '@mui/material/Toolbar';
import Typography from '@mui/material/Typography';
import Button from '@mui/material/Button';
import IconButton from '@mui/material/IconButton';
import MenuIcon from '@mui/icons-material/Menu';
import { useState,useEffect,useContext } from 'react';
import BasicMenu from './Menu';
import { ContactlessOutlined, Login } from '@mui/icons-material';
import { userContext } from './Provider/userProbider';
import { gray } from '../shared-theme/themePrimitives';




export const  TopBar=()=> {
  console.log('topbar')
  const {user,loading}=useContext(userContext)
  console.log(`userの中身:${JSON.stringify(user)}`)
  return (
    <div >
    <Box sx={{ flexGrow: 1 }}>
      <AppBar position="static" sx={{ backgroundColor: "black" }}>
        <Toolbar>
          <BasicMenu/>
          <Typography variant="h6" component="div" sx={{ flexGrow: 1 }}>
            Book
          </Typography>
          <Button color="inherit">{user? user: "Login"}</Button>
        </Toolbar>
      </AppBar>
    </Box>
    </div>
  );
}
