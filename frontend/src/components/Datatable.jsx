// import * as React from 'react';
// import { DataGrid, GridColDef } from '@mui/x-data-grid';
// import Paper from '@mui/material/Paper';
// // import { searchBookImage } from './searchBookImage';
// // import { serialize } from 'v8';
// // import { type } from 'os';
// import { useState,useEffect } from 'react';








// const columns = [
//   { field: 'id', headerName: 'ID', width: 140 },
//   {field:'isbn',headerName:'image',width:250},
//   { field: 'title', headerName: 'Title', width: 250 },
//   { field: 'author', headerName: 'Author', width: 250 },
//   {
//     field: 'status',
//     headerName: 'Status',
//     type: 'number',
//     width: 130,
//   },
// ];

// // const rows = [
// //   { id: 1, isbn: 'Snow', title: 'Jon', author: 35 },
// //   { id: 2, lastName: 'Lannister', firstName: 'Cersei', age: 42 },
// //   { id: 3, lastName: 'Lannister', firstName: 'Jaime', age: 45 },
// //   { id: 4, lastName: 'Stark', firstName: 'Arya', age: 16 },
// //   { id: 5, lastName: 'Targaryen', firstName: 'Daenerys', age: null },
// //   { id: 6, lastName: 'Melisandre', firstName: null, age: 150 },
// //   { id: 7, lastName: 'Clifford', firstName: 'Ferrara', age: 44 },
// //   { id: 8, lastName: 'Frances', firstName: 'Rossini', age: 36 },
// //   { id: 9, lastName: 'Roxie', firstName: 'Harvey', age: 65 },
// // ];

// // const rows=(data)=>{
// //   return data.map((item,index)=>(
// //   {
// //     id:index+1,
// //     isbn:<img src={searchBookImage(item.isbn)}/>,
// //     title:item.title,
// //     author:item.author
// //   }))
// // }

// const searchBookImage=async(isbn)=>{
//   const replace_isbn=isbn.replace(/-/g,'')
//   console.log(`isbn:${replace_isbn}`)
//   // setBookData(replace_isbn)
//   //画像の取得
//   console.log('画像の取得')
//   try{
//     const response= await fetch(`https://ndlsearch.ndl.go.jp/thumbnail/${replace_isbn}.jpg`,{
//             method:'get',
//             mode: 'no-cors'
//     })
//     return response
//   }catch(err){
//     alert('一部書籍情報が取得できず')
//   }

  
// }


// // const fetchBookImage = async (isbn) => {
// //   const replaceIsbn = isbn.replace(/-/g, '');
// //   const url = `https://ndlsearch.ndl.go.jp/thumbnail/${replaceIsbn}.jpg`;
// //   return url; // Assuming direct URL as `no-cors` doesn't allow checking response
// // };

// const fetchBookImage = async (isbn) => {
//   const replaceIsbn = isbn.replace(/-/g, '');
//   return `https://ndlsearch.ndl.go.jp/thumbnail/${replaceIsbn}.jpg`;
// };





// const paginationModel = { page: 0, pageSize: 5 };

// export default function DataTable(props){

//   const [book_rows,SetBookRows]=useState()
//   const [loading_state,setLoadingState]=useState(true)
//   console.log(`ええええ：${JSON.stringify(props.props)}`)

//   // const bookRows=(data)=>{
//   //   return (data.map((item,index)=>(
//   //   {
//   //     id:index+1,
//   //     isbn:<img src={searchBookImage(item.isbn)}/>,
//   //     title:item.title,
//   //     author:item.author
//   //   })))
//   // }

// //   useEffect(()=>{
// //     const prepareRows = async () => {
// //       if (!props.props || !Array.isArray(props.props)) {
// //         console.error('Invalid props data');
// //         return;
// //       }

      
// //     const book_rows=await Promise.all(
// //       props.props.map(async (item, index) => {
// //         const image = await fetchBookImage(item.isbn);
// //         return {
// //           id: index + 1,
// //           isbn: <img src={searchBookImage(item.isbn)}/>,
// //           title: item.title,
// //           author: item.author,
// //           status: item.status || 0,
// //         };
// //       })
// //     )
// //     console.log('画像の表示')
// //     SetBookRows(book_rows)
// //     setLoadingState(false)
// //   }
// //   prepareRows()
// // },[props.props])


// useEffect(() => {
//   const prepareRows = async () => {
//     if (!props.props || !Array.isArray(props.props)) {
//       console.error('Invalid props data');
//       return;
//     }

//     const rows = await Promise.all(
//       props.props.map(async (item, index) => {
//         const imageUrl = await fetchBookImage(item.isbn); // URL取得
//         return {
//           id: index + 1,
//           isbn: <img src={imageUrl} alt="book cover" style={{ width: 100, height: 'auto' }} />,
//           title: item.title,
//           author: item.author,
//           status: item.status || 0,
//         };
//       })
//     );
//     SetBookRows(rows);
//     setLoadingState(false);
//   };

//   prepareRows();
// }, [props.props]);


//   console.log(`aaaa${JSON.stringify(props)}`)
//   // setBookData(props["props"])
//   // const book_data=props["props"]
//   // console.log(`aaa${book_data}`)
//   // console.log(`---${book_data.length}`)
//   // console.log(`型名${typeof book_data}`)
//   return (
//     <Paper sx={{ height: 400, width: '100%' }}>
//       <DataGrid
//         rows={book_rows}
//         columns={columns}
//         initialState={{ pagination: { paginationModel } }}
//         pageSizeOptions={[5, 10]}
//         checkboxSelection
//         sx={{ border: 0 }}
//       />
//     </Paper>
//   );
// }

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
  {
    field: 'status',
    headerName: 'Status',
    type: 'number',
    width: 130,
  },
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
