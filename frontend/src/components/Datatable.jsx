

// この下

import * as React from 'react';
import { DataGrid } from '@mui/x-data-grid';
import Paper from '@mui/material/Paper';
import { useState, useEffect } from 'react';

const columns = [
  { field: 'id', headerName: 'ID', width: 140 },
  {
    field: 'isbn',
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
  { field: 'title', headerName: 'Title', width: 250 },
  { field: 'author', headerName: 'Author', width: 250 },
];

const fetchBookImage =  async(isbn) => {
  const replaceIsbn = isbn.replace(/-/g, '');
  return `https://ndlsearch.ndl.go.jp/thumbnail/${replaceIsbn}.jpg`;
};

const paginationModel = { page: 0, pageSize: 5 };

export default function DataTable(props) {
  const [bookRows, setBookRows] = useState([]);
  const [loadingState, setLoadingState] = useState(true);

  useEffect(() => {
    const prepareRows = async () => {
      if (!props.props || !Array.isArray(props.props)) {
        console.error('Invalid props data');
        return;
      }

      const rows = await Promise.all(
        props.props.map(async (item, index) => {
          const imageUrl = await fetchBookImage(item.isbn);
          return {
            id: index + 1,
            isbn: imageUrl,
            title: item.title,
            author: item.author,
            status: item.status || 0,
          };
        })
      );
      setBookRows(rows);
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
