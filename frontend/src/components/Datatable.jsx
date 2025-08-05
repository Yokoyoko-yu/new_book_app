

// この下

import * as React from 'react';
import { DataGrid } from '@mui/x-data-grid';
import Paper from '@mui/material/Paper';
import { useState, useEffect,useCallback } from 'react';
import { DeleteBookButton } from './DeleteBookButton';


export default function DataTable(props) {
  const [bookRows, setBookRows] = useState([]);
  const [loadingState, setLoadingState] = useState(true);



const handleDelete = useCallback((isbn) => {
  const deletedBook=bookRows.filter((value)=>{return value.isbn!==isbn}).map((row,index)=>({
        id:index+1,
        image:row.image,
        title:row.title,
        author:row.author,
        status:row.status,
        isbn:row.isbn
    }))

    setBookRows(deletedBook);
  }
  )



const columns = [
  { field: 'id', headerName: 'ID', width: 140 },
  {
    field: 'image',
    headerName: 'Image',
    width: 250,
    renderCell: (params) => (
      <img
        src={params.value}
        alt="book cover"
        style={{ width: 100, height: '100%' }}
      />
    ),
  },
  { field: 'title', headerName: 'Title', width: 200 },
  { field: 'author', headerName: 'Author', width: 200 },
  {field:'isbn',headerName:'Delete',width:200,
    renderCell: (params)=>(
      <DeleteBookButton variant="contained" isbn={params.value} onClick={() => handleDelete(params.value)}>削除する</DeleteBookButton>
    )
  }
];

const fetchBookImage =  async(isbn) => {
  const replaceIsbn = isbn.replace(/-/g, '');
  return `https://ndlsearch.ndl.go.jp/thumbnail/${replaceIsbn}.jpg`;
};

const paginationModel = { page: 0, pageSize: 20 };


  useEffect(() => {
    const prepareRows = async () => {
      if (!props.props || !Array.isArray(props.props)) {
        console.error('Invalid props data');
        return;
      }

      const rows = await Promise.all(
        props.props.map(async (item, index) => {
          const imageUrl = await fetchBookImage(item.isbn);
          console.log(item.author)
          return {
            id: index + 1,
            image: imageUrl,
            title: item.title,
            author: item.author,
            status: item.status || 0,
            isbn: item.isbn
          };
        })
      );
      setBookRows(rows);
      console.log(rows);
      setLoadingState(false);
    };

    prepareRows();
  }, [props.props]);

  return (
    <Paper sx={{ height: 800, width: '100%' }}>
      <DataGrid
        rows={bookRows}
        columns={columns}
        rowHeight={125} 
        initialState={{ pagination: { paginationModel } }}
        pageSizeOptions={[5, 10]}
        checkboxSelection
        sx={{
           border: 0 }}
        loading={loadingState}
      />
    </Paper>
  );
}
