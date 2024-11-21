import * as React from 'react';
import Button from '@mui/material/Button';
import Menu from '@mui/material/Menu';
import MenuItem from '@mui/material/MenuItem';
import AppsIcon from '@mui/icons-material/Apps';
import { Link } from '@mui/material';


export default function BasicMenu() {
  const [anchorEl, setAnchorEl] = React.useState<null | HTMLElement>(null);
  const open = Boolean(anchorEl);
  const handleClick = (event: React.MouseEvent<HTMLButtonElement>) => {
    setAnchorEl(event.currentTarget);
  };
  const handleClose = () => {
    setAnchorEl(null);
  };

  const handleLogout=async()=>{
    setAnchorEl(null);
    const request=await fetch('http://127.0.0.1:3000/logout',{
      method:'delete',
      credentials:'include'
    })
    if (request.ok){
      window.location.href='/'
      alert('ログアウトに成功しました。')
    }
  }

  return (
    <div>
      <Button
        id="basic-button"
        aria-controls={open ? 'basic-menu' : undefined}
        aria-haspopup="true"
        aria-expanded={open ? 'true' : undefined}
        onClick={handleClick}
        style={{color:"white"}}
      >
        <AppsIcon/>
      </Button>
      <Menu
        id="basic-menu"
        anchorEl={anchorEl}
        open={open}
        onClose={handleClose}
        MenuListProps={{
          'aria-labelledby': 'basic-button',
        }}
      >
        {/* <MenuItem onClick={handleClose}><Link href="/" underline="hover">{"Home"}</Link></MenuItem> */}
        <MenuItem onClick={handleClose}><Link href="/addbooks">{"図書登録"}</Link></MenuItem>
        <MenuItem onClick={handleClose}><Link href="/mybooks">{"MyBooks"}</Link></MenuItem>
        <MenuItem onClick={handleClose}><Link href="/award">{"Award"}</Link></MenuItem>
        <MenuItem onClick={handleLogout}>Logout</MenuItem>
      </Menu>
    </div>
  );
}
