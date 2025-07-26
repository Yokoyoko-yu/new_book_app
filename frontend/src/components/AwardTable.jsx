import * as React from 'react';
import MenuItem from '@mui/material/MenuItem';
import ListItemIcon from '@mui/material/ListItemIcon';
import ListItemText from '@mui/material/ListItemText';
import SettingsApplicationsIcon from '@mui/icons-material/SettingsApplications';
import { DataGrid, GridColumnMenu } from '@mui/x-data-grid';
import { useDemoData } from '@mui/x-data-grid-generator';
import { useEffect,useState } from "react";

// Custom menu item
function CustomUserItem(props) {
  const { myCustomHandler, myCustomValue } = props;
  return (
    <MenuItem onClick={myCustomHandler}>
      <ListItemIcon>
        <SettingsApplicationsIcon fontSize="small" />
      </ListItemIcon>
      <ListItemText>{myCustomValue}</ListItemText>
    </MenuItem>
  );
}

// Custom column menu
function CustomColumnMenu(props) {
  return (
    <GridColumnMenu
      {...props}
      slots={{
        columnMenuUserItem: CustomUserItem,
      }}
      slotProps={{
        columnMenuUserItem: {
          displayOrder: 15,
          myCustomValue: 'Perform Custom Action',  // Modify the custom action text
          myCustomHandler: () => alert('Custom handler fired'),  // Custom handler
        },
      }}
    />
  );
}

export const AddNewColumnMenuGrid=(props)=>{
  const [columns, setColumns] = React.useState([
    { field: 'times', headerName: '回', width: 200 },
    { field: 'title', headerName: 'タイトル', width: 300,
      renderCell: (params) => (
      <a href={`/award_book_contents/${params.row.id}`}  rel="noopener noreferrer">
        {params.value}
      </a>
    )
     },
    { field: 'author', headerName: '著者', width: 200 },
    {field:'status',headerName:'所持',width:200}
  ]);

  const [rows, setRows] = React.useState(props.data || []);
  console.log("データの中身:",props.data)
    useEffect(() => {
    // IDがなければtitleとtimesを使って仮IDを生成
    const processed = (props.data || []).map((row, index) => ({
      ...row,
      id: row.id ?? `${row.title}-${row.times}-${index}`,
      status: row.has_book==1 ? '○':'×'
    }));
    setRows(processed);
  }, [props.data]);


  return (
    <div style={{ height: 600, width: '100%' }}>
      <DataGrid
        columns={columns}  // Bind columns here
        rows={rows}  // Bind rows here
        slots={{ columnMenu: CustomColumnMenu }}  // Add custom column menu
      />
    </div>
  );
}
